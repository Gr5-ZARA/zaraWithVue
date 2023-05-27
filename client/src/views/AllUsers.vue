<template>
    <div v-for="user in data">
        <div v-if="user.isAdmin===0">
            <h4>{{ user.username }}</h4>
            <p>{{ user.useremail }}</p>
            <hr>
        </div>
    </div>
</template>

<script lang="ts">
import axios from 'axios';
import  { defineComponent, onMounted, ref } from 'vue';
    interface User{
        userid:number,
        useremail:string,
        username:string,
        isAdmin:number
    };
    export default defineComponent({
        name:"AllUsers",
        setup(){
            const data=ref<User[]>([]);
            const  getUsers=async()=>{
                const res=await axios.get('http://localhost:5000/getAll')
                data.value=res.data
            };
            onMounted(()=>{
                getUsers()
            })
            return{
                data,
            }
        },
        methods:{
            async removeUser(){
                
            }
        }

    })
</script>