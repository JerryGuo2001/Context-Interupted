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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p>Task Instructions (1/4)</p><p>Welcome to the last part of this task. The next few slides are important instructions for completing this task. Press the spacebar to continue.</p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (2/4)</p><p>In this last part, you will be asked if you recognize words you may have seen in yesterday's task.</p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (3/4)</p><p>You will respond with either the  Y key for 'yes', or the N key for 'no'. You will have 3 seconds to respond. Only the first answer you enter will be recorded.</p><p>[press the spacebar to continue]</p>",
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
  stimulus:"<div style='margin-left:300px ;margin-right: 300px ;text-justify: auto'><p></p><p>Task Instructions (4/4)</p><p>You will get a few one-minute breaks throughout the task, and after the breaks are over, the task will start again automatically.</p><p>When you are ready, press the spacebar to begin.</p>",
  on_finish: function(data) {
    data.trial_type = "instruct04"
    jsPsych.addNodeToEndOfTimeline({
      timeline: [blr01_memory],
    }, jsPsych.resumeExperiment)
  }
}

//Instruction end here

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

blue_background='white';

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

//part 03 part

var curr_blr03_memory=0
var n_blr03_memory = 3


var blr03_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_blr03_trial(),
  prompt:create_memory_stimulus(blr03_val,curr_blr03_memory,blr03_background),
  on_finish: function (data) {
    data.trial_type = 'blr03_memory';
    sfa=data.key_press
    curr_blr03_memory=curr_blr03_memory+1
    continue_blr03_memory(blr03_val,curr_blr03_memory,blr03_background)
    if(sfa == '89' && curr_blr03_memory<=n_blr03_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr03_thecrossant,blr03_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr03_memory<=n_blr03_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr03_thecrossant,blr03_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_blr03_memory>n_blr03_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr03_memory>n_blr03_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [thank_you],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blr03_memory<=n_blr03_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr03_theredx,blr03_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blr03_memory>n_blr03_memory){
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

function continue_blr03_memory(blr03_val,curr_blr03_memory,blr03_background){
  blr03_memory.stimulus=create_blr03_trial()
  blr03_memory.prompt=create_memory_stimulus(blr03_val,curr_blr03_memory,blr03_background)
}  

var blr03_thecrossant= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_ten(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr03_background),
}

var blr03_theredx= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_redx(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr03_background),
}

//part 03 end

//part 02 start
var curr_blr02_memory=0
var n_blr02_memory = 3


var blr02_memory = {
  type: 'image-keyboard-response',
  choices: ['Y', 'N'],
  stimulus_height: 250,
  stimulus_duration: 3000,
  trial_duration: 3000,
  response_ends_trial: false,
  stimulus:create_blr02_trial(),
  prompt:create_memory_stimulus(blr02_val,curr_blr02_memory,blr02_background),
  on_finish: function (data) {
    data.trial_type = 'blr02_memory';
    sfa=data.key_press
    curr_blr02_memory=curr_blr02_memory+1
    continue_blr02_memory(blr02_val,curr_blr02_memory,blr02_background)
    if(sfa == '89' && curr_blr02_memory<=n_blr02_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr02_thecrossant,blr02_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr02_memory<=n_blr02_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr02_thecrossant,blr02_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '89' && curr_blr02_memory>n_blr02_memory) {
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blr03_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr02_memory>n_blr02_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blr03_memory],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blr02_memory<=n_blr02_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr02_theredx,blr02_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blr02_memory>n_blr02_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blr03_memory],
      }, jsPsych.resumeExperiment)
    }else if(warning>3){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [warning_toolate],
      }, jsPsych.resumeExperiment)
    }
  }
}

function continue_blr02_memory(blr02_val,curr_blr02_memory,blr02_background){
  blr02_memory.stimulus=create_blr02_trial()
  blr02_memory.prompt=create_memory_stimulus(blr02_val,curr_blr02_memory,blr02_background)
}  

var blr02_thecrossant= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_ten(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr02_background),
}

var blr02_theredx= {
  type: 'image-keyboard-response',
  choices: jsPsych.NO_KEYS,
  stimulus_height: 100,
  stimulus_width: 100,
  stimulus_duration: 500,
  trial_duration: 500,
  response_ends_trial: false,
  stimulus:create_memory_redx(),
  prompt:parse("<br><br><style>body {background-color: %s;}</style>",blr02_background),
}

//02 part end

//01 part start
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
        timeline: [oneminbk,blr02_memory],
      }, jsPsych.resumeExperiment)
    }else if(sfa == '78'&& curr_blr01_memory>n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blr02_memory],
      }, jsPsych.resumeExperiment)
    }else if(warning<=3 && curr_blr01_memory<=n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [blr01_theredx,blr01_memory],
      }, jsPsych.resumeExperiment)
      warning=warning+1
    }else if(warning<=3 && curr_blr01_memory>n_blr01_memory){
      jsPsych.addNodeToEndOfTimeline({
        timeline: [oneminbk,blr02_memory],
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

//01 part end

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
timeline.push(instruct01)


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
