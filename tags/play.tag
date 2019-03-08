<play>

<button type="button" class="btn btn-primary" name="button" onclick={startPlay} >start play</button>

<p if={this.playState==="startPlay"}> No.{this.turns} turn: treasure is {treasure}</p>
<p if={this.playCardState==="CardPlay"}> Now, you have {this.userTotalTeasure} treasure in total</p>
<p if={this.playCardState==="CardPlay"}> Now, {this.opponent} have {this.oppoTotalTeasure} treasure in total</p>
<div class="">
<button type="button" class="btn btn-success mr-md-2" name={item} id={item} onclick={playCard} each={item, i in allCards} show={this.playState==="startPlay"} >{item}</button>
</div>





<script>
let tag=this;
this.userInfo=""
observer.on('userId',(userId)=>{
   console.log('userId',userId)
   this.update()
})
observer.on('userName',(userName)=>{
   console.log('userName',userName)
   this.update()
})


this.allCards=[1,2,3,4,5,6,7,8,9,10,11,12,13]
this.playState=""
this.btnCount=0


this.turns="1";
this.youTotalTeasure=0;
this.oppoTotalTeasure=0;
var userName=this.parent.parent.userName;



startPlay(){
 console.log('this',event.target);
    this.playState="startPlay";
    observer.on('play:bot',(treasure)=>{
     this.treasure=treasure
     this.update()
 })
}


playCard(){
    this.gameId=this.parent.gameId;
    this.userId=this.parent.userId;
    console.log('thhh',this.parent.gameId)
    this.cardNumber=event.target.name;
  console.log(this.cardNumber)

    fetch('http://treasure.chrisproctor.net/players/'+ this.userId +'/games/' +this.gameId + '/play/' + this.cardNumber).then(response => {
         return response.json();
     }).then(data => {
         console.log('xLABEL:', data)
         var opponent=Object.keys(data.players)[0]
         this.oppoData=Object.values(data.players)[0]
         this.userData=Object.values(data.players)[1]
         this.oppoTotalTeasure=Object.values(this.oppoData)[0]
         this.userTotalTeasure=Object.values(this.userData)[0]
         this.treasure=data.turns[0].treasure;
         console.log('treasure',treasure)
         this.opponent=opponent
        console.log('opponent',this.oppoData)
         this.newTurns=data.turns[1]
         console.log(this.newTurns)
         this.oppoTurns=Object.values(this.newTurns)[2];
         this.myTurns=Object.values(this.newTurns)[1];
         if ((this.cardNumber==13 && this.oppoTurns==1) || this.oppoTurns>this.cardNumber){
             alert(this.opponent + this.oppoTurns + this.opponent +" get "+ treasure + " ponits" )
         } else if ((this.cardNumber==1 && this.oppoTurns==13)|| this.oppoTurns<this.cardNumber){
             alert(this.opponent + this.oppoTurns + "  You get "+ treasure + " points")
             console.log('userPlay',this.myTurns)
             this.userTotalTeasure=data.players[userName].score
         } else {
             alert(this.opponent + this.oppoTurns + "you and" + this.opponent + "play the same card")
         this.turns=data.turns.length;
         console.log('this.cardNumber',data.turns[1])

         // Work with JSON data here

         document.getElementById(this.cardNumber).style.color = "black";
		 alert("This button is disabled afterward.");
     }
     this.playCardState="CardPlay";
     this.update();
 });

}



</script>


<style>
.statebu{
 height:20px;
 width:80px;
}
</style>
</play>
