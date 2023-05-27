import { createRouter, createWebHistory } from 'vue-router'
import HomeView from "../views/HomeView.vue"
import Login from '@/views/Login.vue'
import Signup from '../views/Signup.vue'
import Search from '../views/Search.vue'
// import Men from '../views/Men.vue'
import product from '../views/product.vue'
import Help from '../views/Help.vue'
import prod from '@/views/prod.vue'
import Cart from '../views/cart.vue'
import AddProduct from '@/views/AddProduct.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path:'/login',
      name:'login',
      component:Login
    },
    {
      path:'/signup',
      name:'Signup',
      component:Signup
    },
    {
      path:'/search',
      name:'Search',
      component:Search
    },
    {
      path:'/products/:category',
      name:'category',
      component:product

    },
    {
      path:'/help',
      name:'Help ',
      component:Help

    },
    {
      path:'/prod/:name',
      name:'prod ',
      component:prod
    },
    {
      path:'/products/:subcategory',
      name:'subcategory',
      component:product
    },
    {
      path:'/cart',
      name:"cart",
      component:Cart
    },
    {
      path:'/addProduct',
      name:"AddProduct",
      component:AddProduct
    }
  ]
})

export default router;