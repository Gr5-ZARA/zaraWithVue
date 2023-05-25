<template>
  <div>
    <div class="container-login" style="margin-top: 2vh;">
      <div class="Left-login-form" style="margin-top: 40vh;">
        <h3 class="login-heading">LOG IN TO YOUR ACCOUNT</h3>
        <div class="form-input-label">
          <input
            class="form-input-label"
            type="text"
            id="fname"
            name="email"
            placeholder="E-MAIL"
            v-model="useremail"
          />
          <input
            class="form-input-label"
            type="password"
            id="fname"
            name="password"
            placeholder="PASSWORD"
            style="outline: none; border: none"
            v-model="userpw"
          />
        </div>

        <button class="login-btn" @click="handleSubmit">LOGIN</button>
        <br />
        <p>{{ Error }}</p>
        <br />
        <a class="forgotpassword" href="#">HAVE YOU FORGOTTEN YOUR PASSWORD?</a>
      </div>

      <div class="right-login-form" style="margin-top: 40vh;">
        <h4>NEED ACCOUNT</h4>
        <router-link to="/signup" class="create-btn" type="button">REGISTER</router-link>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import axios from 'axios';

interface User {
  useremail: string;
  userpw: string;
}

export default defineComponent({
  name: 'LoginForm',
  data() {
    return {
      useremail: '',
      userpw: '',
      Error: '',
    };
  },
  methods: {
    async handleSubmit() {
      try {
        const user: User = {
          useremail: this.useremail,
          userpw: this.userpw,
        };

        const res = await axios.post('http://localhost:5000/api/user/login', user, {
          headers: {
            'Content-Type': 'application/json',
          },
        });

        window.localStorage.setItem('User', JSON.stringify(res.data));
        this.Error = 'Authentication successful';
        window.location.href = '/';
      } catch (err) {
        console.log(err);
        this.Error = String(err);
      }
    },
  },
});
</script>

<style>
.container-login {
  width: 60%;
  display: flex;
  color: gray;
  font-size: 90%;
  margin: 14%;
  justify-content: space-between;
  margin-top: 10%;
}

.Left-login-form {
  margin-top: 40vh;
}

.form-input-label {
  outline: none;
  border: none;
  width: 80%;
  padding: 5px 12px 0 20px;
  margin: 18px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid gray;
  font-size: 100%;
  font-family: 'Helvetica Neue', Helvetica, Arial, Lucida Grande, sans-serif;
}

.right-login-form {
  width: 50%;
  margin-top: 8%;
  margin-top: 40vh;
}

.login-heading {
  margin: 4%;
  color: black;
  font-family: 'Helvetica Neue', Helvetica, Arial, Lucida Grande, sans-serif;
}

.login-btn {
  background-color: black;
  width: 80%;
  height: 13%;
  text-align: center;
  font-size: 90%;
  color: white;
  text-decoration: none;
  margin-top: 6%;
  font-family: 'Helvetica Neue', Helvetica, Arial, Lucida Grande, sans-serif;
}

.forgotpassword {
  color: black;
  font-size: 70%;
  font-family: 'Helvetica Neue', Helvetica, Arial, Lucida Grande, sans-serif;
}

.create-btn {
  background-color: transparent;
  border: 0.5px solid black;
  text-align: center;
  font-size: 90%;
  color: black;
  text-decoration: none;
  padding: 2% 32% 3% 10%;
  font-family: 'Helvetica Neue', Helvetica, Arial, Lucida Grande, sans-serif;
}
</style>
