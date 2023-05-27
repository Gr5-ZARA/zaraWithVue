<template class="add">
    <div >
        <input type="text" placeholder="Product Name" name="productname" v-model="productname"/><br/>
        <input type="text" placeholder="Product Image" name="productimage" v-model="productimage"/><br/>
        <input type="number" placeholder="price" name="productprice" v-model="productprice"/><br/>
        <input type="number" placeholder="quntity" name="productquantity" v-model="productquantity"/><br/>
        <input type="text" placeholder="color" name="productcolor" v-model="productcolor"/><br/>
        <input type="text" placeholder="category" name="productcategory" v-model="productcategory"/><br/>
        <input type="text" placeholder="sub-category" name="productsub-category" v-model="productsubcategory"/><br/>
        <input type="text" placeholder="sub-sub-category" name="productsub-sub-category" v-model="productsubsubcategory"/><br/>
        <button @click="handleSubmit">Add Product</button>
    </div>
</template>

<script lang="ts">
import router from '@/router';
import axios from 'axios';
import  { defineComponent } from 'vue';
import { useRouter } from 'vue-router';

    export default defineComponent({
        name:'AddProduct',
        data(){
            const router=useRouter()
            return{
                productname: "",
                productprice:"",
                productquantity:"",
                productcolor: "",
                productcategory: "",
                productsubcategory: "",
                productsubsubcategory: "",
                productimage: "",
                orderid:5
            };
        },
        methods:{
            async handleSubmit(){
                const newProduct={
                    productname: this.productname,
                    productprice:this.productprice,
                    productquantity:this.productquantity,
                    productcolor: this.productcolor,
                    productcategory: this.productcategory,
                    'productsub-category': this.productsubcategory,
                    'productsub-sub-category': this.productsubsubcategory,
                    productimage: this.productimage,
                    orderid:this.orderid
                }
                await axios.post('http://localhost:5000/api/products',newProduct)
                console.log(newProduct)
                router.push('/')
            }
        }    
    })
</script>

<style>
    .add{
        top: 400px;
        left: 600px;
    }
</style>