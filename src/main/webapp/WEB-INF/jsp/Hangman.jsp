<div class="wrapper">
   <h1>Hangman</h1>
    <h2>Vanilla JavaScript Hangman Game</h2>
    <p>Use the alphabet below to guess the word, or click hint to get a clue. </p>
</div>
<div class="wrapper">
    <div id="buttons">
    </div>  
    <p id="catagoryName"></p>
    <div id="hold">
    </div>
    <p id="mylives"></p>
    <p id="clue">Clue -</p>  
     <canvas id="stickman">This Text will show if the Browser does NOT support HTML5 Canvas tag</canvas>
    <div class="container">
      <button id="hint">Hint</button>
      <button id="reset">Play again</button>
    </div>
</div>

<style>
/* Variabes */  
$orange: #ffa600;
$green: #c1d72e;
$blue: #82d2e5;
$grey:#f3f3f3;
$white: #fff;
$base-color:$green ;

/* Mixin's */ 

@mixin transition {
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}

@mixin clear {
  &:after {
      content: "";
      display: table;
      clear: both;
    }
}

 @mixin box-size {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

 @mixin transition {
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

@mixin fade {
  -moz-transition: all 1s ease-in;
  -moz-transition:all 0.3s ease-in-out;
  -webkit-transition:all 0.3s ease-in-out;
}

@mixin opacity {
  opacity:0.4;
  filter:alpha(opacity=40); 
  @include fade;
}

@mixin corners ($radius) {
  -moz-border-radius: $radius;
  -webkit-border-radius: $radius;
  border-radius: $radius; 
  -khtml-border-radius: $radius; 
}

body {
  background:$base-color;
  font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
  color:$white;
  height:100%;
  text-align:center;
  font-size:18px;
}

.wrappper{
  @include clear;
  width:100%;
  margin:0 auto;
}


canvas{
  color:$white;
  border: $white dashed 2px;
  padding:15px;
}

h1, h2, h3 {
	font-family: 'Roboto', sans-serif;
	font-weight: 100;
	text-transform: uppercase;
   margin:5px 0;
}

h1 {
	font-size: 2.6em;
}

h2 {
	font-size: 1.6em;
}

p{
  font-size: 1.6em;
}

#alphabet {
  @include clear;
  margin:15px auto;
  padding:0;
  max-width:900px;
}

#alphabet li {
  float:left;
  margin: 0 10px 10px 0;
  list-style:none;
  width:35px;
  height:30px;
  padding-top:10px;
  background:$white;
  color:$base-color;
  cursor:pointer;
  @include corners(5px);
  border: solid 1px $white;
    
    &:hover{
      background:$base-color;
      border: solid 1px $white;
      color:$white;
    }
}

#my-word {
  margin: 0;
  display: block;
  padding: 0;
  display:block;
}

#my-word li {
  position: relative;
  list-style: none;
  margin: 0;
  display: inline-block;
  padding: 0 10px;
  font-size:1.6em;
}

.active {
  @include opacity;
  cursor:default;
    
  &:hover{
      @include fade;
      @include opacity;
    }
}

#mylives{
  font-size:1.6em;
  text-align:center;
  display:block;
}

button{
  @include corners (5px);
  background:$base-color;
  color:$white;
  border: solid 1px $white;
  text-decoration:none;
  cursor:pointer;
  font-size:1.2em;
  padding:18px 10px;
  width:180px;
  margin: 10px;
  outline: none;
  
    &:hover{
      @include transition;
      background:$white;
      border: solid 1px $white;
      color:$base-color;
    }
}

@media (max-width: 767px) {
  #alphabet {
  padding:0 0 0 15px;
}
  }

  @media (max-width: 480px) {
  #alphabet {
  padding:0 0 0 25px;
}
  }
  </style>
  
  <script>
  window.onload = function () {

	  var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
	        'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
	        't', 'u', 'v', 'w', 'x', 'y', 'z'];
	  
	  var categories;         // Array of topics
	  var chosenCategory;     // Selected catagory
	  var getHint ;          // Word getHint
	  var word ;              // Selected word
	  var guess ;             // Geuss
	  var geusses = [ ];      // Stored geusses
	  var lives ;             // Lives
	  var counter ;           // Count correct geusses
	  var space;              // Number of spaces in word '-'

	  // Get elements
	  var showLives = document.getElementById("mylives");
	  var showCatagory = document.getElementById("scatagory");
	  var getHint = document.getElementById("hint");
	  var showClue = document.getElementById("clue");



	  // create alphabet ul
	  var buttons = function () {
	    myButtons = document.getElementById('buttons');
	    letters = document.createElement('ul');

	    for (var i = 0; i < alphabet.length; i++) {
	      letters.id = 'alphabet';
	      list = document.createElement('li');
	      list.id = 'letter';
	      list.innerHTML = alphabet[i];
	      check();
	      myButtons.appendChild(letters);
	      letters.appendChild(list);
	    }
	  }
	    
	  
	  // Select Catagory
	  var selectCat = function () {
	    if (chosenCategory === categories[0]) {
	      catagoryName.innerHTML = "The Chosen Category Is Premier League Football Teams";
	    } else if (chosenCategory === categories[1]) {
	      catagoryName.innerHTML = "The Chosen Category Is Films";
	    } else if (chosenCategory === categories[2]) {
	      catagoryName.innerHTML = "The Chosen Category Is Cities";
	    }
	  }

	  // Create geusses ul
	   result = function () {
	    wordHolder = document.getElementById('hold');
	    correct = document.createElement('ul');

	    for (var i = 0; i < word.length; i++) {
	      correct.setAttribute('id', 'my-word');
	      guess = document.createElement('li');
	      guess.setAttribute('class', 'guess');
	      if (word[i] === "-") {
	        guess.innerHTML = "-";
	        space = 1;
	      } else {
	        guess.innerHTML = "_";
	      }

	      geusses.push(guess);
	      wordHolder.appendChild(correct);
	      correct.appendChild(guess);
	    }
	  }
	  
	  // Show lives
	   comments = function () {
	    showLives.innerHTML = "You have " + lives + " lives";
	    if (lives < 1) {
	      showLives.innerHTML = "Game Over";
	    }
	    for (var i = 0; i < geusses.length; i++) {
	      if (counter + space === geusses.length) {
	        showLives.innerHTML = "You Win!";
	      }
	    }
	  }

	      // Animate man
	  var animate = function () {
	    var drawMe = lives ;
	    drawArray[drawMe]();
	  }

	  
	   // Hangman
	  canvas =  function(){

	    myStickman = document.getElementById("stickman");
	    context = myStickman.getContext('2d');
	    context.beginPath();
	    context.strokeStyle = "#fff";
	    context.lineWidth = 2;
	  };
	  
	    head = function(){
	      myStickman = document.getElementById("stickman");
	      context = myStickman.getContext('2d');
	      context.beginPath();
	      context.arc(60, 25, 10, 0, Math.PI*2, true);
	      context.stroke();
	    }
	    
	  draw = function($pathFromx, $pathFromy, $pathTox, $pathToy) {
	    
	    context.moveTo($pathFromx, $pathFromy);
	    context.lineTo($pathTox, $pathToy);
	    context.stroke(); 
	}

	   frame1 = function() {
	     draw (0, 150, 150, 150);
	   };
	   
	   frame2 = function() {
	     draw (10, 0, 10, 600);
	   };
	  
	   frame3 = function() {
	     draw (0, 5, 70, 5);
	   };
	  
	   frame4 = function() {
	     draw (60, 5, 60, 15);
	   };
	  
	   torso = function() {
	     draw (60, 36, 60, 70);
	   };
	  
	   rightArm = function() {
	     draw (60, 46, 100, 50);
	   };
	  
	   leftArm = function() {
	     draw (60, 46, 20, 50);
	   };
	  
	   rightLeg = function() {
	     draw (60, 70, 100, 100);
	   };
	  
	   leftLeg = function() {
	     draw (60, 70, 20, 100);
	   };
	  
	  drawArray = [rightLeg, leftLeg, rightArm, leftArm,  torso,  head, frame4, frame3, frame2, frame1]; 


	  // OnClick Function
	   check = function () {
	    list.onclick = function () {
	      var geuss = (this.innerHTML);
	      this.setAttribute("class", "active");
	      this.onclick = null;
	      for (var i = 0; i < word.length; i++) {
	        if (word[i] === geuss) {
	          geusses[i].innerHTML = geuss;
	          counter += 1;
	        } 
	      }
	      var j = (word.indexOf(geuss));
	      if (j === -1) {
	        lives -= 1;
	        comments();
	        animate();
	      } else {
	        comments();
	      }
	    }
	  }
	  
	    
	  // Play
	  play = function () {
	    categories = [
	        ["everton", "liverpool", "swansea", "chelsea", "hull", "manchester-city", "newcastle-united"],
	        ["alien", "dirty-harry", "gladiator", "finding-nemo", "jaws"],
	        ["manchester", "milan", "madrid", "amsterdam", "prague"]
	    ];

	    chosenCategory = categories[Math.floor(Math.random() * categories.length)];
	    word = chosenCategory[Math.floor(Math.random() * chosenCategory.length)];
	    word = word.replace(/\s/g, "-");
	    console.log(word);
	    buttons();

	    geusses = [ ];
	    lives = 10;
	    counter = 0;
	    space = 0;
	    result();
	    comments();
	    selectCat();
	    canvas();
	  }

	  play();
	  
	  // Hint

	    hint.onclick = function() {

	      hints = [
	        ["Based in Mersyside", "Based in Mersyside", "First Welsh team to reach the Premier Leauge", "Owned by A russian Billionaire", "Once managed by Phil Brown", "2013 FA Cup runners up", "Gazza's first club"],
	        ["Science-Fiction horror film", "1971 American action film", "Historical drama", "Anamated Fish", "Giant great white shark"],
	        ["Northern city in the UK", "Home of AC and Inter", "Spanish capital", "Netherlands capital", "Czech Republic capital"]
	    ];

	    var catagoryIndex = categories.indexOf(chosenCategory);
	    var hintIndex = chosenCategory.indexOf(word);
	    showClue.innerHTML = "Clue: - " +  hints [catagoryIndex][hintIndex];
	  };

	   // Reset

	  document.getElementById('reset').onclick = function() {
	    correct.parentNode.removeChild(correct);
	    letters.parentNode.removeChild(letters);
	    showClue.innerHTML = "";
	    context.clearRect(0, 0, 400, 400);
	    play();
	  }
	}

  </script>



