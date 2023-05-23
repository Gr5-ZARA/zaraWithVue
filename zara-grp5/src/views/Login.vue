<template>
    <div>
      <div class='container-login' >
        <div class='Left-login-form'>
          <h3 class='login-heading'>LOG IN TO YOUR ACCOUNT</h3>
          <div class='form-input-label'>
            <input class='form-input-label' type="text" id="fname" name="email" placeholder='E-MAIL'  />
            <input class='form-input-label' type="password" id="fname" name="password" placeholder='PASSWORD'   />
          </div>
  
          <button class="login-btn" >LOGIN</button> <br/>
          <p>{Error}</p> <br/>
          <a class="forgotpassword" href='#'>HAVE YOU FORGOTTEN YOUR PASSWORD?</a>
        </div>
  
        <div class='right-login-form'>
          <h4>NEEED ACCOUNT</h4>
          <Link href="/signup" class="create-btn" type="button">REGISTER</Link>
        </div>
      </div>
    </div>
  </template>
  
 

<style>
    .container-login{
        /* margin-top: 2vh; */
        /* margin-top: 1.6em; */
        /* width: 60%; */
        display: flex;
        color: gray;
        font-size: 90%;
        margin:14%;
        justify-content: space-between;
        /* margin: 9%; */
        /* margin-top: 10%;  */
    }
    .Left-login-form{
        margin-top:40vh ;
        /* width: 40%; */
    }
    .form-input-label{
        outline: none;
        border: none;
        /* width: 80%; */
        /* padding:5px 12px 0 20px; */
        margin: 18px 0;
        box-sizing: border-box;
        border: none;
        border-bottom: 1px solid gray;
        font-size:100%;
    }
    .right-login-form{
        /* width: 50%; */
        margin-top: 8%;
        /* margin-top:40vh ; */
    }
    .login-heading{
        margin: 4%;
        color: black;
    }
    .login-btn{
        background-color: black;
        width: 80%;
        height: 13%;
        text-align: center;
        font-size: 90%;
        color: white;
        text-decoration: none;
        margin-top: 6%;
    }
    .forgotpassword{
        color: black;
        font-size: 70%;

    }
    .create-btn{
        background-color: transparent;
        border: 0.5px solid black;
        text-align: center;
        font-size: 90%;
        color: black;
        text-decoration: none;
        padding:2% 32% 3% 10%;
    }
</style>