import { createRouter, createWebHistory } from 'vue-router'
import HomeView from "../views/HomeView.vue"
import Login from '@/views/Login.vue'
import Signup from '../views/Signup.vue'
import Search from '../views/Search.vue'

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
    }
  ]
})

export default router
