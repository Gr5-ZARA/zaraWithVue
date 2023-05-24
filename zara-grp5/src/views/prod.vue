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

    const fetchOrderId = (username: string) => {
      axios
        .get(`http://localhost:5000/api/user/one/${username}`)
        .then((res) => {
          console.log(res);
          orderid.value = res.data[0].orderid;
        })
        .catch((err) => {
          console.log(err);
        });
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

      postData(prod);
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
      fetchData(name);

      const storedData = window.localStorage.getItem('User');
      if (storedData) {
        const parsedData: UserData = JSON.parse(storedData);
        const username = parsedData.user?.[0].username;
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