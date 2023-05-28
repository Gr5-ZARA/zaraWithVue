<template>
    <div>
      <div v-if="data.length === 0">Loading...</div>
      <div v-else>
        <div class="container">
          <div class="left">
            <h2>MATERIALS, CARE AND ORIGIN</h2>
            <h3>JOIN LIFE</h3>
            <p>Care for water produced using less water.</p>
            <br />
            <p>COMPOSITION & CARE To assess compliance, we have developed a program of audits and continuous improvement plans.</p>
            <br />
            <h2>MATERIALS</h2>
            <p>We work with monitoring programs to ensure compliance with our social, environmental, and health and safety standards for our garments.</p>
            <br />
            <p>The Green to Wear 2.0 standard aims to minimize the environmental impact.</p>
            <a href="#"><p>View more</p></a>
          </div>
          <div class="containerprod">
            <div class="img1">
              <img class="centerimgprod" :src="data[0].productimage" alt="Product Image" />
            </div>
          </div>
          <div>
            <div class="right" style="margin-right: 40px;">
              <h2 class="cat">{{ data[0].productname }}</h2>
              <h3>Lapelless blazer made of a linen blend fabric. Long sleeves. Flap pockets on the front. Tie belt in the same fabric. Matching lining. Double-breasted fastening with hidden button.</h3>
              <br />
              <span><p class="pricetag">{{ data[0].productprice }}$</p></span>
              <p>MRP incl. of all taxes</p>
              <br />
              <p>{{ data[0].productcolor }} | 0647/301</p>
              <br />
              <select name="" id="prodsize">
                <option value="null">Select your size</option>
                <option value="EU 36 (UK 29)">EU 36 (UK 29)</option>
                <option value="EU 38 (UK 38)">EU 38 (UK 38)</option>
                <option value="EU 40 (UK 40)">EU 40 (UK 40)</option>
                <option value="EU 42 (UK 42)">EU 42 (UK 42)</option>
                <option value="EU 44 (UK 34)">EU 44 (UK 34)</option>
              </select>
  
              <button @click="handleAdd">Add to bag</button>
  
              <button>Process order</button>
  
              <p>CHECK IN-STORE AVAILABILITY DELIVERY, EXCHANGES AND RETURNS</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>

<script lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

interface Product {
  productname: string;
  productprice: number;
  productquantity: number;
  productcolor: string;
  productcategory: string;
  'productsub-category': string;
  'productsub-sub-category': string;
  productimage: string;
  orderid: number;
}

export default {
  name: 'DetailName',
  setup() {
    const router=useRouter()
    const data = ref<Product[]>([]);
    const orderid = ref<number>(0);
    
    const fetchData = (name: string) => {
      axios
        .get(`http://localhost:5000/api/products/one/${name}`)
        .then((res) => {
          data.value = res.data;
          console.log(res.data);
        })
        .catch((err) => console.log(err));
    };

    const fetchOrderId = async(username: string) => {
      console.log(username)
      const res=await axios.get(`http://localhost:5000/api/user/one/${username}`)
          console.log(res.data);
          orderid.value = res.data[0].orderid;
    };

    const handleAdd = () => {
      const prod: Product = {
        productname: data.value[0]?.productname || '',
        productprice: data.value[0]?.productprice || 0,
        productquantity: data.value[0]?.productquantity || 0,
        productcolor: data.value[0]?.productcolor || '',
        productcategory: data.value[0]?.productcategory || '',
        'productsub-category': data.value[0]?.['productsub-category'] || '',
        'productsub-sub-category': data.value[0]?.['productsub-sub-category'] || '',
        productimage: data.value[0]?.productimage || '',
        orderid: orderid.value,
      };
      console.log(prod)
      postData(prod);
      router.push('/cart')
    };

    const postData = (prod: Product) => {
      axios
        .post('http://localhost:5000/api/products/', prod)
        .then((res) => {
          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
    };

    onMounted(() => {
      const name = window.location.pathname.split('/')[2];
      console.log(name)
      fetchData(name);

      const storedData = window.localStorage.getItem('User');
      console.log(storedData)
      if (storedData) {
        const parsedData: UserData = JSON.parse(storedData);
        const username = parsedData.user?.[0].username;
        // console.log(username)
        fetchOrderId(username);
      }
    });

    return {
      data,
      handleAdd,
    };
  },
};
</script>

<style>
/* header{
    padding: 5px 20px;
    display: flex;
    position: fixed;
    
} */
.fa-bars{
    font-size: 25px;
}
.logo{
   max-width: 100%;
    height: auto;
    margin-left: 4%;
    margin-top: -55px;
    padding-left: 15%;
}
.rightnavlogin{
    margin-top: -16px;
    display: flex;
    padding-left: 194%;
    
}

a {
    color:black;
    user-select: none;
    box-sizing: border-box;
    text-transform: uppercase;
    text-decoration: none;
    font-family: Neue-Helvetica, Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 12px;
    line-height: 26px;
    font-stretch: semi-condensed;
    margin-right: 20px;
}

.container{
    margin: auto;
    padding-top: 140px;
    display: flex;
    justify-content: space-around;
    
    display: flex;
    justify-content: space-between;
}

.centerimgprod{ 
        height: 600px;
        width: 400px;
        display: block;
        margin-left: auto;
        margin-right:auto;  
}

.img1{
    
    margin: auto;
    margin-top: 5%;
    max-width: 350px;
    
    
}

.price, .new{
    margin: 4px;
    margin-left: 1px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 10px;
    font-weight: bold;
    font-stretch: semi-condensed;
    
}

.right{
    
    margin-top: 20px;
    width: 230px;
    height: 320px;
    padding-top: 100px;
    flex-basis: 30%;
}
.left{
    
    margin-top: 20px;
    width: 230px;
    height: 320px;
    padding-top: 100px;
    flex-basis: 30%;
    margin-right: 40px;
}


.right,.left, h3, p{
    font-size: 10px;
    font-family: Arial, Helvetica, sans-serif;
    
}
.right span p{
    display: inline;
}

.right button{
    background-color: rgb(61, 59, 59);
    color: white;
    width: 100%;
    cursor: pointer;
    height: 30px;
    margin: 8px 0px;
}

.right select{
  
    background: transparent;
    padding: 5px;
    width: 100%;
}

.right h3{
    word-spacing: 2px;
    line-height: 12px;
}
/* when add to bag click visiblity block */
.right button~button{
    visibility: hidden;
    
}

</style>