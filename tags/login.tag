<login>

<div class="containter">
    <div class="col-3">

    <div class="row-3">
      <button type="button" class="btn btn-primary" name="button" onclick={stateLogin} hide={this.state} >Log in</button>
      <button type="button" class="btn btn-primary" name="button" onclick={stateSignup} hide={this.state}>Sign up</button>
   </div>
</div>


<newUser if={this.state==="stateSignup"}></newUser>
<oldUser if={this.state==="stateLogin"}></oldUser>
    </div>
<script>
this.state="";
console.log('state',this.state);
stateSignup(){
    this.state="stateSignup";
}
stateLogin(){
    this.state="stateLogin"
}

</script>

<style>
    :scope{}

 button{

     font-size:60px;

 }
p{
 font-size:30px;
}
input{
 font-size:50px;
}

</style>
</login>
