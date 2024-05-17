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
  html: "<div><h1>This experiment ended early</h1><br><h1>Please Log Out</h1></div>",
}

//Instruction page begin
var instruct01={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus: "<div style='margin-left:300px ;margin-right:300px ;text-justify: auto'><p style='margin-bottom: 20px;'>Task Instructions (1/11)</p><p style='margin-bottom: 20px;'><p><p>The next few slides are important instructions for completing this part of the task.</p><p style='margin-bottom: 20px;'><p><p>There will be a comprehension quiz at the end of these instructions to make sure you know how to complete the task.</p><p><p style='margin-bottom: 20px;'>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (2/11)</p><p><p>Before beginning, please maximize this browser.</p><p><p>This experiment is designed to be taken in a single sitting, meaning you must complete the task end-to-end once you start.</p><p><p>Additionally, please do not navigate away from this screen while completing this task.</p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (3/11)</p><p><p>In this task, there will be 3 learning blocks in which you will see object words paired with colors.</p><p><p>Try to imagine the word in the color it is paired with.</p><p><p>Once you have tried, press the<b> Y </b>key if you were able to or the<b> N </b>if not.</p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (4/11)</p><p><p>It is important you respond to each word and color pair, and respond as soon as you have tried imagining the word as the color it is paired with.</p><p><p>You have a maximum of 3 seconds to respond, and can respond only once.</p><p><p>The word and color pair will remain on the screen for the entire 3 seconds, even if you respond before the time is up.</p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (5/11)</p><p><p> After responding there will be no indication that your response has been recorded, and the color pair will remain on the screen for the entirety of the 3 seconds. </p><p><p> Once the 3 seonds have passed, you will see the following symbol flash in the center of the screen indicating you successfully responded:</p><img src='../static/images/isi.png' width='300' height='300'><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (6/11)</p><p><p>You will see the following symbol flash in the center of the screen if you do not respond in 3 seconds, indicating the trial was missed. <p><p> If you miss more than 3 trials the experiment will end and you will be compensated for your time.</p><img src='../static/images/redx.jpg' width='300' height='300'><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (7/11)</p><p><p>You will get 3 one-minute breaks throughout the task, and a two-minute break toward the end.</p><p><p>After each break, you will complete a short attention task where you will see a row of arrows, and need to indicate which direction the center arrow is pointing in.</p><p><p> Press <b> Y </b> for <b> left </b> and <b> N </b> for <b> right </b> </p><p> Here is an example:</p><img src='../static/images/ror01.png'><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (8/11)</p><p><p>You will indicate which direction the center arrow is pointing in by responding with either the<b> Y </b> key for <b> left </b> or<b> N </b> be for <b> right</b>.</p><p><p>You will only have 2 seconds to respond once the image shows up.</p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (9/11)</p><p><p>You will get to practice a few times before the real task begins.</p><p><p>You will be tested on your memory of these words at the end of this task, and again 24 hours from now, so it is important you are not distracted.</p><p><p>Please silence your cell phone, make sure you are in a quiet space, and pay close attention.</p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (10/11)</p><p>In summary: </p><p><p>1. You will try to imagine a series of object words as the colors they are paired with.</p><p><p>2. If you are able to imagine it, press the<b> Y </b>key. If you can't, press the<b> N </b>key.</p><p><p>3. Remember to enter your response as soon as you have tried imagining the word as the color it is paired with! </p><p><p>4. You have 3 seconds to respond to each pair.</p><p><p>5. There will be 3 learning blocks followed by a recognition task. </p><p><p>6. After each block there will be a break followed by a short attention task before beginning the next block. </p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (11/11)</p><p><p>You will now answer a few questions to confirm that you understand the instructions.<p><p> Each question will remain on the screen until you press the correct key. </p><p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Comprehension Quiz (1/5)</p><p><p>Enter the key you should press if you are able to imagine the word as the color it is paired with:</p><p>The<b> Y </b>key</p><p>or</p><p>The<b> N </b>key</p>",
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
  type: 'html-keyboard-response',
  choices: ['a', 'b','c'],
  stimulus:"<div style='text-align:left;'><p>Comprehension Quiz (2/5)</p><p><p>How many seconds do you have to respond to each trial? Press the correct key. </p> a = 1 second <br> b = 2 seconds<br> c = 3 seconds<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz02"
    if(data.key_press == '67')  {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck02,checkquiz03],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '65'|| data.key_press == '66'){
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
  type: 'html-keyboard-response',
  choices: ['a', 'b','c'],
  stimulus:"<div style='text-align:left;'><p>Comprehension Quiz (3/5)</p><p><p>When will you return to Prolific to be tested on your memory of today's task? Press the correct key.</p> a = in 12 hours<br> b = in 24 hours<br> c = in 48 hours<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz03"
    if(data.key_press == '66') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck03,checkquiz04],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '65'|| data.key_press == '67'){
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
  type: 'html-keyboard-response',
  choices: ['a', 'b','c'],
  stimulus:"<div style='text-align:left;'><p>Comprehension Quiz (4/5)</p><p><p>When should you respond to the word and color pairs with your keyboard? Press the correct key.</p> a = As soon as you have tried to imagine the word as the color<br> b = When three seconds have passed<br> c = When they first appear on the screen<br> <br><br><br></div>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz04"
    if(data.key_press == '65') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck04,checkquiz05],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '66'|| data.key_press == '67'){
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

var checkquiz05={
  type: 'html-keyboard-response',
  choices: ['Y','N'],
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Comprehension Quiz (5/5)</p><p><p>Enter the key you should press to indicate the middle arrow is point right during the attention task</p><p><p>The<b> Y </b>key</p><p>or</p><p>The<b> N </b>key</p>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "checkquiz05"
    if(data.key_press == '78') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforcheck05,checkforquizcomplete],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '89'){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,checkquiz05],
      }, jsPsych.resumeExperiment)
    }
  }
}

var correctforcheck05={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  stimulus:'<p>correct = b</p>',
}

var checkforquizcomplete={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Comprehension Quiz Complete!</p><p>You have successfully completed the comprehension quiz.</p><p>You will now move on to some practice trials, which have the same format as described in the instructions. Please place youre fingers of the <b> Y </b> and <b> N </b> keys. </p><p>[press the spacebar to continue]</p>",
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
  html:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p> Can you imagine the word with the color? Y or N <p></p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Practice Complete!</p><p>You have successfully completed the practice trials.</p><p>You will now move on to the actual experiment, which will have exactly the same format, but with more trials.</p><p>Remember to respond as soon as you try to imagine the object word as the color it is paired with.</p><p>You will have a one minute break before starting. </p><p>[press the spacebar to continue]</p>",
  on_finish: function(data) {
    data.trial_type = "praccomple"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [oneminbk,sectionending0],
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
  stimulus:'<h1>Please make sure to respond to the questions.</h1><br><h1>Continued failure to respond will</h1><br><h1> result in the task ending early</h1><br><h1>Please press the "Space Bar" to resume the experiment</h1>',
  on_finish: function(data) {
    data.trial_type='warning_page'
    warning=warning+1
  }
}

var warning_toolate={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus:'<h1>You failed to respond the question</h1><br><h1>Your Session has ended</h1><br><h1>You will be compensated for the time you spent on this task. Thank you.</h1><br><h1>Please press the "Space Bar" to log out, and then close this browser.</h1>',
  on_finish: function(data) {
    data.trial_type='warning_toolate'
    save_data(true)
  }
}


// blue
var curr_blue_memory=0
var n_blue_memory = 79


var blue_memory = {
  type: 'image-keyboard-response',
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Can you imagine the word in the color? Y or N</p>",
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
        timeline: [ending1,oneminbk,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blue_memory>n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending1,oneminbk,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blue_memory<=n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,blue_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blue_memory>n_blue_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending1,oneminbk,blue_breakquiz],
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


var sectionending0={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p> Starting learning block (1/3) </p><p> Please place youre fingers of the <b> Y </b> and <b> N </b> keys </p><p> Press the [Space Bar] to continue </p>",
  response_ends_trial: true,
  on_finish: function(data) {
    data.trial_type = "sectionheading0"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [blue_memory],
    }, jsPsych.resumeExperiment)
  }
}

// One minute break
var oneminbk = {
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus: '<div id="countdown"><h1>Break Time!</h1><p id="demo" style="font-size: 48px;"></p></div>',
  stimulus_height: 250,
  stimulus_duration: 60000,
  trial_duration: 60000,
  response_ends_trial: false,
  on_start: function(data) {
    var countDownDate = Date.now() + 60000; // Set the countdown to 1 minute from now
    var x = setInterval(function() {
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var seconds = Math.ceil(distance / 1000);
      if (seconds <= 0) {
        clearInterval(x);
      } else {
        document.getElementById("demo").innerHTML = seconds + "s "
      }
    }, 1000)
  },
  on_finish: function(data) {
    data.trial_type = "oneminbk"
  }
}



//two minute break
var twominbk = {
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus: '<div id="countdown"><h1>Break Time!</h1><p id="demo" style="font-size: 48px;"></p></div>',
  stimulus_height: 250,
  stimulus_duration: 120000,
  trial_duration: 120000,
  response_ends_trial: false,
  on_start: function(data) {
    var countDownDate = Date.now() + 120000; // Set the countdown to 2 minutes from now
    var x = setInterval(function() {
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var minutes = Math.floor(distance / (1000 * 60));
      var seconds = Math.ceil((distance % (1000 * 60)) / 1000);
      if (distance <= 0) {
        clearInterval(x);
      } else {
        document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s"
      }
    }, 1000)
  },
  on_finish: function(data) {
    data.trial_type = "twominbk"
  }
}


var ending1={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:'<p>Learning block 1/3 complete!</p>You will have a one minute break, followed by a short attention task.</p> Then you will start the next learning block. </p><p> [Press the space bar to continue] </p>',
  on_finish: function(data) {
    data.trial_type='ending1'
}
}


var blue_breakquiz={
  type: 'html-keyboard-response',
  choices: ['Y','N'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><img src='../static/images/ror02.png'><p></p>Select the direction of the middle arrow. </p><p>The <b> Y </b>key for left </p><p>or</p><p>The<b> N </b>key for right</p>",
  response_ends_trial: true,
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "blue_breakquiz"
    if(data.key_press == '89') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforbluebreak,sectionending1],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '78'){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [wrongforcheck,blue_breakquiz],
      }, jsPsych.resumeExperiment)
    }
  }
}

var correctforbluebreak={
  type: 'html-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus:'<p>correct = Left</p>',
  stimulus_height: 250,
  stimulus_duration: 1500,
  trial_duration: 1500,
  response_ends_trial: false,
  on_finish: function(data) {
    data.trial_type='correctforbluebreak'
}
}

var sectionending1={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p> Starting learning block (2/3) </p><p> Please place youre fingers of the <b> Y </b> and <b> N </b> keys </p><p> Press the [Space Bar] to continue </p>",
  response_ends_trial: true,
  on_finish: function(data) {
    data.trial_type = "sectionheading1"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [red_memory],
    }, jsPsych.resumeExperiment)
  }
}

var ending2={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:'<p>Learning block 2/3 complete!</p>You will have a one minute break, followed by a short attention task.</p> Then you will start the next learning block.</p><p> [Press the space bar to continue] </p>',
  on_finish: function(data) {
    data.trial_type='ending2'
    save_data(true)
}
}

var red_breakquiz={
  type: 'html-keyboard-response',
  choices: [ 'Y','N'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><img src='../static/images/ror03.png'><p></p>Select the direction of the middle arrow. </p><p>The<b> Y </b>key for left </p><p>or</p><p>The<b> N </b>key for right</p>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "red_breakquiz"
    if(data.key_press == '89') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforredbreak,sectionending2],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '78'){
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
  on_finish: function(data) {
    data.trial_type='correctforredbreak'
}
}

var sectionending2={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p> Starting learning block (3/3) </p><p>  Press the [Space Bar] to continue </p>",
  response_ends_trial: true,
  on_finish: function(data) {
    data.trial_type = "sectionheading2"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [yellow_memory],
    }, jsPsych.resumeExperiment)
  }
}

var ending3={
  type: 'html-keyboard-response',
  choices: ['space'],
  response_ends_trial: true,
  stimulus:'<p>Learning block 3/3 complete!</p>You will have a two minute break, followed by a short attention task.</p> Then you will start the baseline recognition task.</p><p> [Press the space bar to continue] </p>',
  on_finish: function(data) {
    data.trial_type='ending3'
}
}

var yellow_breakquiz={
  type: 'html-keyboard-response',
  choices: [ 'Y','N'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><img src='../static/images/ror04.png'><p></p>Select the direction of the middle arrow. </p><p>The<b> Y </b>key for left </p><p>or</p><p>The<b> N </b>key for right</p>",
  on_finish: function(data) {
    var response=data.responses
    data.trial_type = "yellow_breakquiz"
    if(data.key_press == '78') {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [correctforyellowbreak,sectionending3],
      }, jsPsych.resumeExperiment)
    }else if(data.key_press == '89'){
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
  on_finish: function(data) {
    data.trial_type='correctforyellowbreak'
}
}

var sectionending3={
  type: 'html-keyboard-response',
  choices: ['space'],
  stimulus: "<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p> Starting the baseline recognition task.<p></p>You will be asked if you saw any of these words previously in the experiment<p></p> Press <b> Y </b> for yes </p><p>Press <b> N </b> for No </p><p> Press the [Space Bar] to continue </p>",
  response_ends_trial: true,
  on_finish: function(data) {
    data.trial_type = "sectionheading3"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [blr_memory],
    }, jsPsych.resumeExperiment)
  }
}

//one minute break

//red room begin
var curr_red_memory=0
var n_red_memory = 79

var red_memory = {
  type: 'image-keyboard-response',
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Can you imagine the word in the color? Y or N</p>",
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
        timeline: [ending2,oneminbk,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_red_memory>n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending2,oneminbk,red_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_red_memory<=n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,red_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_red_memory>n_red_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending2,oneminbk,red_breakquiz],
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
var n_yellow_memory = 79

var yellow_memory = {
  type: 'image-keyboard-response',
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Can you imagine the word in the color? Y or N</p>",
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
        timeline: [ending3,twominbk,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_yellow_memory>n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending3,twominbk,yellow_breakquiz],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_yellow_memory<=n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [theredx,yellow_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_yellow_memory>n_yellow_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [ending3,twominbk,yellow_breakquiz],
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
var curr_blr_memory=0
var n_blr_memory = 29


var blr_memory = {
  type: 'image-keyboard-response',
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Do you remember this word? Y or N?</p>",
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_blr_trial(),
  prompt:create_memory_stimulus(blr_val,curr_blr_memory,blr_background),
  on_finish: function (data) {
    data.trial_type = 'blr_memory';
    sfa=data.key_press
    curr_blr_memory=curr_blr_memory+1
    continue_blr_memory(blr_val,curr_blr_memory,blr_background)
    if(sfa == '89' && curr_blr_memory<=n_blr_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr_thecrossant,blr_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr_memory<=n_blr_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr_thecrossant,blr_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_blr_memory>n_blr_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr_memory>n_blr_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blr_memory<=n_blr_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr_theredx,blr_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blr_memory>n_blr_memory){
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

function continue_blr_memory(blr_val,curr_blr_memory,blr_background){
  blr_memory.stimulus=create_blr_trial()
  blr_memory.prompt=create_memory_stimulus(blr_val,curr_blr_memory,blr_background)
}  

var blr_thecrossant= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_ten(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr_background),
}

var blr_theredx= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_redx(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr_background),
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
// timeline.push(instruct01)
timeline.push(ending3,twominbk,yellow_breakquiz)


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
