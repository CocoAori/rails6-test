/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/start.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/start.js":
/*!***************************************!*\
  !*** ./app/javascript/packs/start.js ***!
  \***************************************/
/*! no static exports found */
/***/ (function(module, exports) {

var main = document.querySelector("#main");
var qna = document.querySelector("#qna");
var result = document.querySelector("#result");
var endPoint = qnaList.length; //const select = [];

var select = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

function calResult() {
  /*
  var pointArray = [
    { name: 'mouse', value: 0, key: 0 },
    { name: 'cow', value: 0, key: 1 },
    { name: 'tiger', value: 0, key: 2 },
    { name: 'rabbit', value: 0, key: 3 },
    { name: 'dragon', value: 0, key: 4 },
    { name: 'snake', value: 0, key: 5 },
    { name: 'horse', value: 0, key: 6 },
    { name: 'sheep', value: 0, key: 7 },
    { name: 'monkey', value: 0, key: 8 },
    { name: 'chick', value: 0, key: 9 },
    { name: 'dog', value: 0, key: 10 },
    { name: 'pig', value: 0, key: 11 },
  ]
   for(let i=0; i < endPoint; i++){
    var target = qnaList[i].a[select[i]];
    for(let j=0; j < target.type.length; j++){
      for(let k=0; k < pointArray.length; k++){
        if(target.type[j] === pointArray[k].name){
          pointArray[k].value += 1;
        }
      }
    }
  }
   var resultArray = pointArray.sort(function (a,b){
    if(a.value > b.value){
      return -1;
    }
    if(a.value < b.value){
      return 1;
    }
    return 0;
  });
   */

  /*
  console.log(resultArray);
  let resultword = resultArray[0].key;
  return resultword;
  */
  var result = select.indexOf(Math.max.apply(Math, select));
  console.log(result);
  return result;
}

function setResult() {
  var point = calResult();
  var resultName = document.querySelector('.resultname');
  resultName.innerHTML = infoList[point].name;
  var resultImg = document.createElement('img');
  var imgDiv = document.querySelector('#resultImg');
  var imgURL = 'img/image-' + point + '.png';
  resultImg.src = imgURL;
  resultImg.alt = point;
  resultImg.classList.add('img-fluid');
  imgDiv.appendChild(resultImg);
  var resultDesc = document.querySelector('.resultDesc');
  resultDesc.innerHTML = infoList[point].desc;
}

function goResult() {
  qna.style.WebkitAnimation = "fadeOut 1s";
  qna.style.animation = "fadeOut 1s";
  setTimeout(function () {
    result.style.WebkitAnimation = "fadeIn 1s";
    result.style.animation = "fadeIn 1s";
    setTimeout(function () {
      qna.style.display = "none";
      result.style.display = "block";
    }, 900);
  }); //

  console.log(select);
  setResult(); //calResult();
}

function addAnswer(answerText, qIdx, idx) {
  var a = document.querySelector('.answerBox');
  var answer = document.createElement('button');
  answer.classList.add('answerList');
  answer.classList.add('my-3');
  answer.classList.add('py-3');
  answer.classList.add('mx-auto');
  answer.classList.add('fadeIn');
  a.appendChild(answer);
  answer.innerHTML = answerText;
  answer.addEventListener("click", function () {
    var children = document.querySelectorAll('.answerList');

    for (var i = 0; i < children.length; i++) {
      children[i].disabled = true;
      children[i].style.WebkitAnimation = "fadeOut 1s";
      children[i].style.animation = "fadeOut 1s";
    }

    setTimeout(function () {
      //select[qIdx] = idx;
      var target = qnaList[qIdx].a[idx].type;

      for (var j = 0; j < target.length; j++) {
        select[target[j]] += 1;
      }

      for (var _i = 0; _i < children.length; _i++) {
        children[_i].style.display = 'none';
      }

      goNext(++qIdx);
    }, 900);
  }, false);
}

function goNext(qIdx) {
  if (qIdx === endPoint) {
    goResult();
    return;
  }

  var q = document.querySelector('.qBox');
  q.innerHTML = qnaList[qIdx].q;

  for (var i in qnaList[qIdx].a) {
    addAnswer(qnaList[qIdx].a[i].answer, qIdx, i);
  }

  var status = document.querySelector('.statusBar');
  status.style.width = (qIdx + 1) / endPoint * 100 + '%'; //status.style.width = (100/endPoint) * (qIdx+1) + '%';
}

function begin() {
  main.style.WebkitAnimation = "fadeOut 1s";
  main.style.animation = "fadeOut 1s";
  setTimeout(function () {
    qna.style.WebkitAnimation = "fadeIn 1s";
    qna.style.animation = "fadeIn 1s";
    setTimeout(function () {
      main.style.display = "none";
      qna.style.display = "block";
    }, 100);
    var qIdx = 0;
    goNext(qIdx);
  }, 800);
}

/***/ })

/******/ });
//# sourceMappingURL=start-9e8387f0fb518fb69dcd.js.map