
   <template>
    <div>
      <CartDetail v-for="e in prod" :key="e.productid" :e="e" />
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref, watchEffect } from 'vue';
  import axios from 'axios';
  import { PropType as VuePropType } from 'vue'; 
  
  import CartDetail from './cartDetails.vue';
  
  interface Product {
    productid: number;
    productname: string;
    productprice: number;
    productquantity: number;
    productcolor: string;
    productcategory: string;
    'productsub-category': string;
    'productsub-sub-category': string;
    productimage: string;
  }
  
  export default defineComponent({
    name: 'cart',
    components: {
      CartDetail,
    },
    props: {
      orderid:Number,
    },
    setup(props) {
      const prod = ref<Product[]>([]);
  
      const fetchData = (id: number | undefined) => {
        axios
          .get(`http://localhost:5000/api/products/${id}`)
          .then((res) => {
            prod.value = res.data;
            console.log(res.data, 'product');
          })
          .catch((err) => {
            console.log(err);
          });
      };
      console.log(props)
      watchEffect(() => {
        fetchData(props.orderid);
      });
  
      return {
        prod,
      };
    },
  });
  </script>
  

  
 
  

  