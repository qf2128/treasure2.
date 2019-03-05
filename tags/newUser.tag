<newUser>
  <div class= "center">
    <h1 hide={this.loginState==="oldUser"}> Ahoy there Matey !</h1>
  </div>
  <div class="row">
    <div class="left">
      <input type="text" value="" placeholder="input your new name" ref="userName" hide={this.loginState==="oldUser"}>
    </div>
    <div class="right">
      <button type="button" onclick="{getChrisDataNewId}"  class="btn btn-primary" hide={this.loginState==="oldUser"}>SUBMIT</button>
    </div>
    <div show={this.loginState==="oldUser"}>
      <h1> Ahoy there  {this.userName} !</h1>
      <h2>This is your User ID: {this.userId} !</h2>
      <p>Please remember your ID, </p>
    </div>


<script>
let tag=this;
console.log(this);


getChrisDataNewId(){
  var userName=this.refs.userName.value;

  fetch('http://treasure.chrisproctor.net/players/new/' + userName).then(response => {
        return response.json();
    }).then(data => {
        // Work with JSON data here
        this.userId=data.pid;
        this.loginState="oldUser"
        console.log('64526', data);
        this.treasure={
            users:{
            first:{
                 name:userName,
                 id:"",
              }
            }
          }
         this.treasure.users.first.id=this.userId
         this.update();
    });

  }
</script>


<style>
    :scope{}
input{
  font-size: 25px;
}

.center{
  display: block;
  margin-left: 30%;
}

.left{
  margin-left:30%;
}

.right{
  margin-left: 10%;
}
</style>
</newUser>
