<game>
<div class="container">


<p hide={this.state}> Do you want to start a new game to play with a bot or your friend?</p>
<button type="button" class="btn btn-primary" name="button" onclick={newGame} hide={this.state}>New game</button>

<p hide={this.state}> If your friend has already invited you and given you the room number, please click Join button</p>
<button type="button" class="btn btn-primary" name="button" onclick={join} hide={this.state}>Join</button>

<div class="row" if={this.state==="newGame"} hide={this.gameState==="autoplay"} >

<p> choose game type</p>
<select class="custom-select" name="" onchange={updateNewGameType}>
    <option value="">---</option>
    <option value="autoplay">Play with Bot</option>
    <option value="invite">Invite a friend</option>
</select>
</div>

<button type="button" name="button"  class="btn btn-primary" onclick={resume} hide={this.state}>resume previous game</button>
<playBot if={this.gameState==="autoplay"}></playBot>
</div>

<script>
this.state=""
observer.on('userId',(userId)=>{
    this.userId=userId;
     });

newGame(){
    this.state="newGame";
    console.log('this',this)
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/new').then(response => {
            return response.json();
        }).then(data => {
            var gameId=data.gid
            console.log('gameid 2',gameId)
            this.gameId=data.gid
            observer.trigger('gameId', gameId);
            // Work with JSON data here
        });


    }

updateNewGameType(){
    console.log('select',this);
   this.gameState=event.target.value
console.log('select',this.gameState)
   if (this.gameState=="autoplay"){
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' + this.gameId + '/autoplay').then(response => {
            return response.json();
        }).then(data => {
            console.log('autoplay',data)
       treasure=data.turns[0].treasure
            observer.trigger('play:bot',treasure);
        this.update();
            // Work with JSON data here
        });
   }

   if(this.gameState=="invite"){
       fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' + this.gameId).then(response => {
            return response.json();
        }).then(data => {
            alert("please tell your friend your room Id:" + this.gameId)
            console.log('Invite friend',data)
            // Work with JSON data here
            this.update();
        });
   }




}

</script>

<style>
 :scope{}

 .container {
     background-image: url(./asset/login.jpg);
     background-repeat:no-repeat;
     height:1000px;
   }

</style>

</game>
