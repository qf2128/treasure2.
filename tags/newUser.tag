<newUser>

    <input type="text" value="" placeholder="input your new name" ref="userName" hide={this.loninState==="oldUser"}>
    <button type="button" onclick="{getChrisDataNewId}"  class="btn btn-primary" hide={this.loninState==="oldUser"}>Confirm</button>
    <oldUser if={this.userId}></oldUser>

<script>
let tag=this;
console.log(this);


getChrisDataNewId(){
var userName=this.refs.userName.value;

fetch('https://treasure.chrisproctor.net/players/new/' + userName).then(response => {
        return response.json();
    }).then(data => {
        // Work with JSON data here
        this.userId=data.pid;
        alert('this is your user id: ' + this.userId + ' please remember')
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
         this.loninState="oldUser"
    });
}

</script>
<style>
    :scope{}
</style>
</newUser>
