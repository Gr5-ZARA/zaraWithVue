import { createRouter, createWebHistory } from 'vue-router'
import HomeView from "../views/HomeView.vue"
import Login from '@/views/Login.vue'
import Signup from '../views/Signup.vue'
import Search from '../views/Search.vue'
// import Men from '../views/Men.vue'
import product from '../views/product.vue'
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
      name:'Men',
      component:product

    }

  ]
})

export default router
