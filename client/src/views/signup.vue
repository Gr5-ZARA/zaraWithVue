
<template>
    <div className="con"></div>
    <div class="container">
      <div class="Left-form">
        <h2 class="headingform">PERSONAL DETAILS</h2>
        <input class="input-text" type="text" id="email" name="useremail" placeholder="E-MAIL" v-model="useremail" />
        <div class="input-text-box">
          <input class="input-text" type="password" id="password" name="password" placeholder="PASSWORD" v-model="userpw"/>
        </div>
        <div class="input-text-box">
          <input class="input-text" type="text" id="fname" name="fname" placeholder="NAME" v-model="username" />
        </div>
        <div class="checkbox">
          <div>
            <input
              class="form-input-checkbox__input"
              type="checkbox"
              name="newsletterCheck"
              data-qa-input-qualifier="newsletterCheck"
            />
          </div>
          <div>
            <h6 class="checkbox__label">I want to receive personalised commercial communications from ZARA by email.</h6>
          </div>
        </div>
        <div class="checkbox">
          <div>
            <input
              class="form-input-checkbox__input"
              type="checkbox"
              name="newsletterCheck"
              data-qa-input-qualifier="newsletterCheck"
            />
          </div>
          <div>
            <h6 class="checkbox__label">I have read and understand the Privacy and Cookies Policy</h6>
          </div>
        </div>
        <input type="submit" @click="handleSubmit" class="signupbtn" />
      </div>
      <div class="right-form">
        <div class="input-text-box">
          <h1 class="dot">.</h1>
        </div>
        <div class="input-text-box1">
          <input type="password" id="pw"  placeholder="REPEAT PASSWORD" v-model="confirmuserpw"/>
        </div>
        <div class="input-text-box">
          <input type="text" id="surname"  placeholder="SURNAME" v-model="userlastname" />
        </div>
        <div class="input-text-box"></div>
      </div>
    </div>
  </template>
  
  
  <script lang="ts">
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent({
  name: 'SignupForm',
  data() {
    return {
      useremail: '',
      userpw: '',
      confirmuserpw: '',
      username: '',
      userlastname: '',
      newsletterCheck: false,
      privacyCheck: false,
    };
  },
  methods: {
    goToLogin(){
      this.$router.push({name:'login'})
    },
    async handleSubmit() {
      const newUser = {
        username: this.username,
        userlastname: this.userlastname,
        useremail: this.useremail,
        userpw: this.userpw,
        isAdmin:0
      };
      try {
         const res=await axios.post('http://localhost:5000/api/user/signup', newUser, {
          headers: {
            'Content-Type': 'application/json',
          },
        });
        this.goToLogin()
      } catch (error) {
        console.error(error);
      }
    },
  },
});
</script>
  
  <style >
  .con{
    margin-Top : "100px";
    margin : 30px;
    
  }
  .container{
      width: 100%;
      display: flex;
      margin: 5%;
      position:fixed;
      height: 60%;
      margin-top: 40px;
    }
    input{
      width: 80%;
      padding:5px 12px 0 20px;
      margin: 18px 0;
      box-sizing: border-box;
      border: none;
      border-bottom: 1px solid gray;
      font-size:70%;
  
  
    }
    .number-box{
      display: flex;
    }
    .input-text-box1{
      display: flex;
      margin-top:227px    

  
    }
    .tele{
      width: 25%;
      margin-top: 9%;
    }
    .teleinput{
      margin-left:-10%;
      width:96%;
    }
    .checkbox{
      width: 100%;
      display: flex;
      margin-top: 1%;
  
    }
    .checkbox__label{
      width: 100%;
      margin-left: 3%;
      font-size: 100%;
      color:  gray;
      font-size:70%
  
    }
    .signupbtn{
    width: 85%;
    background-color: white ;
    color: rgb(6, 6, 6);
    margin-top: 16%;
    display: flex;
    flex-flow: column nowrap;
    padding: 14px 28px;
    cursor: pointer;
    border: 0.5px solid black;
  
    }
    .Left-form{
      margin-Top : "100px";
      width: 30%;
    }
    .right-form{
      width: 40%;
      margin-Top : "100px";
    }
    .dot{
      color: white;
    }
    .input-text-options{
    font-size: 90%;
    color: gray;
    }
    .changeform-btn{
    display: flex;
    width: 14%;
    justify-content: space-between;
    margin: 4%;
    font-size: 80%;
    font-weight:bold;
    }
    .headingform{
      font-size: 98%;
      color: black;
      font-weight: bold;
      justify-content: space-between;
      margin-left:70px;
      margin-top:200px    
    }
    .signup-footer{
      display: flex;
      width: 40%;
      justify-content: space-between;
      margin: 8%;
      
    }
    .list{
    text-decoration: none;
    color:gray;
    font-size: 68%;
    }
    .header-heading{
      font-size: 80%;
      
    } 
    
  
    </style >