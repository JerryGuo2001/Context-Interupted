var debug_mode = 0; // debug mode determines how long the blocks are, 5 sec in debug mode, 5 minutes in actual experiment
//var data_save_method = 'csv_server_py';
var data_save_method = 'csv_server_py';

// Will be set to true when experiment is exiting fullscreen normally, to prevent above end experiment code
var normal_exit = false;
var window_height = window.screen.height;



//this is to test if the user leave the webpage
var detectfocus=0
var isinfocus=1
document.addEventListener('mouseleave', e=>{
  detectfocus=detectfocus+1
  isinfocus=0
  //this is to see if user are focus or not
})
document.addEventListener('visibilitychange', e=>{
   if (document.visibilityState === 'visible') {
 //report that user is in focus
 isinfocus=1
  } else {
  detectfocus=detectfocus+1
  isinfocus=0
  //this is to see if user are focus or not
  }  
})

// Randomly generate an 8-character alphanumeric subject ID via jsPsych
var subject_id = jsPsych.randomization.randomID(8);

// Load PsiTurk
var psiturk = new PsiTurk(uniqueId, adServerLoc, mode);
var condition = psiturk.taskdata.get('condition') + 1; // they do zero-indexing

var timeline = []
var perf = 0
var bonus;


var n_prac_learn = 10
var n_prac_choice = 2
var curr_prac_memory=0
var n_prac_memory = 9

var n_learn = 36
var n_choice = 4
var n_memory = 42

//helper functions
// check if arrays match, for quiz checking purposes
var arraysMatch = function (arr1, arr2) {
  // Check if the arrays are the same length
  if (JSON.stringify(arr1) === JSON.stringify(arr2)) {
    return true;
  } else {
    return false
  }
};

var get_answers = function (answers_dict) {
  var answers = []
  var keys = ["Q0", "Q1", "Q2"]

  keys.forEach(function (item, index) {
    answers.push(answers_dict[item])
  });
  return answers
}

var correct_answers = ['C', 'B', 'C'];

// for calculating bonus


var get_choices = function () {
  var choices = []
  for (var i = 1; i < n_choice + 1; i++) {
    choices.push(jsPsych.data.get().last(i).values()[0].key_press)
  }
  return choices
}

var choice_perf = function (trial_press, correct_answers) {
  var n_correct_ans = 0
  for (var i = 0; i < n_choice; i++) {
    if (trial_press[i] == correct_answers[i]) {
      n_correct_ans = n_correct_ans + 1
    }
  }
  return n_correct_ans
}

//end early
var nad=0
localStorage.setItem('nad',nad)
var endearly={
  type: 'survey-html-new',
  html: "<div><h1>This experiment end early</h1><br><h1>Please Log Out</h1></div>",
}

//Instruction page begin
var instruct01={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Task Instructions (1/11)</p><p>The next few slides are important instructions for completing this part of the task.</p><p>There will be a comprehension quiz at the end of these instructions to make sure you know how to complete the task.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct01"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct02],
    }, jsPsych.resumeExperiment)
  }
}

var instruct02={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (2/11)</p><p>Before beginning, please maximize this browser.</p><p>This experiment is designed to be taken in a single sitting, meaning you must complete the task end-to-end once you start.</p><p>Additionally, please do not navigate away from this screen while completing this task.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct02"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct03],
    }, jsPsych.resumeExperiment)
  }
}

var instruct03={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (3/11)</p><p>In this task, you will see object words paired with colors.</p><p>Try to imagine the word in the color it is paired with.</p><p>Once you have tried, press the<b> Y </b>key if you were able to or the<b> N </b>if not.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct03"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct04],
    }, jsPsych.resumeExperiment)
  }
}
var instruct04={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (4/11)</p><p>It is important you respond to each word and color pair, and respond as soon as you have tried imagining the word as the color it is paired with.</p><p>You have a maximum of three seconds to respond, and can respond only once.</p><p>The word and color pair will remain on the screen for the entire three seconds, even if you respond before the time is up.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct04"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct05],
    }, jsPsych.resumeExperiment)
  }
}
var instruct05={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (5/11)</p><p>You will see the following symbol flash in the center of the screen if you successfully respond within three seconds:</p><img src='../static/images/isi.png' width='300' height='300'><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct05"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct06],
    }, jsPsych.resumeExperiment)
  }
}
var instruct06={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (6/11)</p><p>You will see the following symbol flash in the center of the screen if you do not respond in three seconds, to let you know the trial was missed. If you miss more than 3 trials the experiment will end and you will be compensated for your time.</p><img src='../static/images/redx.jpg' width='300' height='300'><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct06"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct07],
    }, jsPsych.resumeExperiment)
  }
}
var instruct07={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (7/11)</p><p>You will get 2 one-minute breaks throughout the task, and a two-minute break toward the end.</p><p>After each break, you will complete a short task where you will see a row of arrows, and need to indicate which direction the center arrow is pointing in. Here is an example:</p><img src='../static/images/ror01.png'><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct07"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct08],
    }, jsPsych.resumeExperiment)
  }
}

var instruct08={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (8/11)</p><p>You will indicate which direction the center arrow is pointing in by responding with either the<b> right </b>or<b> left </b>. You will only have 2 seconds to respond once the image shows up.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct08"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct09],
    }, jsPsych.resumeExperiment)
  }
}

var instruct09={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (9/11)</p><p>You will get to practice a few times before the real task begins.</p><p>You will be tested on your memory of these words at the end of this task, and again 24 hours from now, so it is important you are not distracted.</p><p>Please silence your cell phone, make sure you are in a quiet space, and pay close attention.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct09"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct10],
    }, jsPsych.resumeExperiment)
  }
}
var instruct10={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (10/11)</p><p>In summary: you will try to imagine a series of object words as the colors they are paired with.</p><p>If you are able to, press the<b> Y </b>key. If you can't, press the<b> N </b>key.</p><p>Remember to enter your response as soon as you have tried imagining the word as the color it is paired with! You have three seconds to respond to each pair.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct10"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [instruct11],
    }, jsPsych.resumeExperiment)
  }
}
var instruct11={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (11/11)</p><p>You will now answer a few questions to confirm that you understand the instructions. Each question will remain on the screen until you press the correct key. </p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "instruct11"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [checkquiz01],
    }, jsPsych.resumeExperiment)
  }
}

//Instruction end here

//checkquiz start here

var checkquiz01={
  type: 'html-keyboard-response',
  choices: ['Y', 'N'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Comprehension Quiz (1/4)</p><p>Enter the key you should press if you are able to imagine the word as the color it is paired with:</p><p>The<b> Y </b>key</p><p>or</p><p>The<b> N </b>key</p>",
  on_finish: function(data) {
    data.trial_type = "checkquiz01"
    if(data.key_press == '89') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck01,checkquiz02],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '78'){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,checkquiz01],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforcheck01={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = Y</p>',
}
var wrongforcheck={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>Incorrect</p>',
}

var checkquiz02={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><p>Comprehension Quiz (2/4)</p><p>How many seconds do you have to respond to each trial?</p><input type='radio' name='Q2' value='A' checked> a = 1 second<br><input type='radio' name='Q2' value='B'> b = 2 seconds<br><input type='radio' name='Q2' value='C'> c = 3 seconds<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz02"
    if(response == '{"Q2":"C"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck02,checkquiz03],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,checkquiz02],
      }, jsPsych.resumeExperiment)
    }
  }
}

var correctforcheck02={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = c</p>',
}

var checkquiz03={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><p>Comprehension Quiz (3/4)</p><p>When will you return to Prolific to be tested on your memory of today's task?</p><input type='radio' name='Q3' value='A' checked> a = in 12 hours<br><input type='radio' name='Q3' value='B'> b = in 24 hours<br><input type='radio' name='Q3' value='C'> c = in 48 hours<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz03"
    if(response == '{"Q3":"B"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck03,checkquiz04],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,checkquiz03],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforcheck03={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = b</p>',
}

var checkquiz04={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><p>Comprehension Quiz (4/4)</p><p>When should you respond to the word and color pairs with your keyboard?</p><input type='radio' name='Q4' value='A' checked> a = As soon as you have tried to imagine the word as the color<br><input type='radio' name='Q4' value='B'> b = When three seconds have passed<br><input type='radio' name='Q4' value='C'> c = When they first appear on the screen<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz04"
    if(response == '{"Q4":"A"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck04,checkforquizcomplete],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,checkquiz04],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforcheck04={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = a</p>',
}

var checkforquizcomplete={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Comprehension Quiz Complete!</p><p>You have successfully completed the comprehension quiz.</p><p>You will now move on to some practice trials, which have the same format as described in the instructions.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "checkforquizcomplete"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [prac_memory],
    }, jsPsych.resumeExperiment)
  }
}

//checkquiz end here

//practice quiz begin


var curr_prac_memory=0
var n_prac_memory = 3

var prac_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_prac_trial(),
  prompt:create_memory_stimulus(prac_val,curr_prac_memory,prac_background),
  on_finish: function (data) {
    data.trial_type = 'prac_memory';
    sfa=data.key_press
    curr_prac_memory=curr_prac_memory+1
    continue_prac_memory(prac_val,curr_prac_memory,prac_background)
    if(sfa == '89' && curr_prac_memory<=n_prac_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,prac_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_prac_memory<=n_prac_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,prac_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_prac_memory>n_prac_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [praccomple],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_prac_memory>n_prac_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [praccomple],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_prac_memory<=n_prac_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,prac_memory],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_prac_memory>n_prac_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [praccomple],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_prac_memory(prac_val,curr_prac_memory,prac_background){
  prac_memory.stimulus=create_prac_trial()
  prac_memory.prompt=create_memory_stimulus(prac_val,curr_prac_memory,prac_background)
}  

var praccomple={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Practice Complete!</p><p>You have successfully completed the practice trials.</p><p>You will now move on to the actual experiment, which will have exactly the same format, but with more trials.</p><p>Remember to respond as soon as you try to imagine the object word as the color it is paired with.</p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "praccomple"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [blue_memory],
    }, jsPsych.resumeExperiment)
  }
}

//practice quiz end here

//welcome page
var welcome = {
  type: 'survey-html-form',
  html: " <label for='worker_id'>Re-Enter your Prolific Worker ID. Please make sure this is correct! </label><br><input type='text' id='worker_id' name='worker_id' required><br><br>",
  on_finish: function (data) {
    data.trial_type = "id_enter"
  }
}

//this is the function to change string to leave number only
function changestrtonum (a){
  b=a.replace(/\D/g, "")
  return(b)
}
//this is the end part of the function

var warning=1
var warning_page={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:'<h1>Please make sure to respond to the questions.</h1><br><h1>Continued failure to respond will</h1><br><h1> result in the task ending early</h1><br><h1>Click "Space" to resume the experiment</h1>',
  on_finish: function(data) {
    data.trial_type='warning_page'
    warning=warning+1
  }
}

var warning_toolate={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus:'<h1>You failed to respond to the question</h1><br><h1>Your Session has end</h1><br><h1>You will be compensated for the time you spent on this task. Thank you.</h1><br><h1>Please Press "Space Bar" to Log Out, and then close this browser.</h1>',
  on_finish: function(data) {
    data.trial_type='warning_toolate'
    save_data(true)
  }
}


// blue
var curr_blue_memory=0
var n_blue_memory = 3


var blue_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_blue_trial(),
  prompt:create_memory_stimulus(blue_val,curr_blue_memory,blue_background),
  on_finish: function (data) {
    data.trial_type = 'blue_memory';
    sfa=data.key_press
    curr_blue_memory=curr_blue_memory+1
    continue_blue_memory(blue_val,curr_blue_memory,blue_background)
    if(sfa == '89' && curr_blue_memory<=n_blue_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,blue_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blue_memory<=n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,blue_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_blue_memory>n_blue_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blue_memory>n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blue_memory<=n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,blue_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blue_memory>n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_blue_memory(blue_val,curr_blue_memory,blue_background){
  blue_memory.stimulus=create_blue_trial()
  blue_memory.prompt=create_memory_stimulus(blue_val,curr_blue_memory,blue_background)
}  

var thecrossant= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_ten(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blue_background),
}

var theredx= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_redx(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blue_background),
}



//one minute break
var oneminbk= {
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 6000,
  trial_duration: 6000,
  response_ends_trial: false,
  stimulus:"<h1>BreakTime!</h1>"
}


var blue_breakquiz={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><img src='../static/images/ror02.png'><br><input type='radio' name='BQ01' value='A' checked> Left<br><input type='radio' name='BQ01' value='B'> Right</div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "blue_breakquiz"
    if(response == '{"BQ01":"A"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforbluebreak,red_memory],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforbluebreak={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = Left</p>',
}

var red_breakquiz={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><img src='../static/images/ror03.png'><br><input type='radio' name='BQ02' value='A' checked> Left<br><input type='radio' name='BQ02' value='B'> Right</div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "red_breakquiz"
    if(response == '{"BQ02":"A"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforredbreak,yellow_memory],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforredbreak={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = Left</p>',
}

var yellow_breakquiz={
  type: 'survey-html-form',
  html:"<div style='text-align:left;'><img src='../static/images/ror04.png'><br><input type='radio' name='BQ03' value='A' checked> Left<br><input type='radio' name='BQ03' value='B'> Right</div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "yellow_breakquiz"
    if(response == '{"BQ03":"B"}') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforyellowbreak,blr01_memory],
      }, jsPsych.resumeExperiment)
    }else{
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }
  }
}
var correctforyellowbreak={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = Right</p>',
}

//one minute break

//red room begin
var curr_red_memory=0
var n_red_memory = 3

var red_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_red_trial(),
  prompt:create_memory_stimulus(red_val,curr_red_memory,red_background),
  on_finish: function (data) {
    data.trial_type = 'red_memory';
    sfa=data.key_press
    curr_red_memory=curr_red_memory+1
    continue_red_memory(red_val,curr_red_memory,red_background)
    if(sfa == '89' && curr_red_memory<=n_red_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,red_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_red_memory<=n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,red_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_red_memory>n_red_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_red_memory>n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_red_memory<=n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,red_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_red_memory>n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_red_memory(red_val,curr_red_memory,red_background){
  red_memory.stimulus=create_red_trial()
  red_memory.prompt=create_memory_stimulus(red_val,curr_red_memory,red_background)
}  

//red room end

//yellow room start

var curr_yellow_memory=0
var n_yellow_memory = 3

var yellow_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_yellow_trial(),
  prompt:create_memory_stimulus(yellow_val,curr_yellow_memory,yellow_background),
  on_finish: function (data) {
    data.trial_type = 'yellow_memory';
    sfa=data.key_press
    curr_yellow_memory=curr_yellow_memory+1
    continue_yellow_memory(yellow_val,curr_yellow_memory,yellow_background)
    if(sfa == '89' && curr_yellow_memory<=n_yellow_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,yellow_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_yellow_memory<=n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thecrossant,yellow_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_yellow_memory>n_yellow_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_yellow_memory>n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_yellow_memory<=n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,yellow_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_yellow_memory>n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_yellow_memory(yellow_val,curr_yellow_memory,yellow_background){
  yellow_memory.stimulus=create_yellow_trial()
  yellow_memory.prompt=create_memory_stimulus(yellow_val,curr_yellow_memory,yellow_background)
}  

//yellow room end

//baselinerecgonition start
var curr_blr01_memory=0
var n_blr01_memory = 3


var blr01_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_blr01_trial(),
  prompt:create_memory_stimulus(blr01_val,curr_blr01_memory,blr01_background),
  on_finish: function (data) {
    data.trial_type = 'blr01_memory';
    sfa=data.key_press
    curr_blr01_memory=curr_blr01_memory+1
    continue_blr01_memory(blr01_val,curr_blr01_memory,blr01_background)
    if(sfa == '89' && curr_blr01_memory<=n_blr01_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr01_thecrossant,blr01_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr01_memory<=n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr01_thecrossant,blr01_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_blr01_memory>n_blr01_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr01_memory>n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blr01_memory<=n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr01_theredx,blr01_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blr01_memory>n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_blr01_memory(blr01_val,curr_blr01_memory,blr01_background){
  blr01_memory.stimulus=create_blr01_trial()
  blr01_memory.prompt=create_memory_stimulus(blr01_val,curr_blr01_memory,blr01_background)
}  

var blr01_thecrossant= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_ten(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr01_background),
}

var blr01_theredx= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_redx(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr01_background),
}

//baselinerecognition end

// final thank you
var thank_you = {
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus: "<p> Congratulations, you are all done!</p><p>The secret code to enter at the beginning screen is: AJFHBG897</p><p> Please make sure to submit the HIT and email mnadkarn@gmail.com if you had any issues! </p>",
  on_finish: function (data) {
    data.trial_type = 'thank_you';
    data.detectfocus = detectfocus;
    save_data(true)
  }
}
timeline.push(welcome)
timeline.push(blr01_memory)


jsPsych.init({
  timeline: timeline,
  preload_images: all_images,
  max_load_time: 600000,
  on_finish: function () {
    /* Retrieve the participant's data from jsPsych */
    // Determine and save participant bonus payment
    psiturk.recordUnstructuredData("subject_id", subject_id);
    save_data(true)
  },
})
