// TODO  重复代码太多,暂时还不是很熟悉js,留待以后修改
function showEnglish(obj) {
  var eDiv = document.getElementById("page-english");
  var cDiv = document.getElementById("page-chinese");
  eDiv.style.display="block";

  cDiv.style.display="none";
  var cA = document.getElementById("aChinese");
  cA.className = "";
  obj.className = "";
  obj.className +="selected";
}
function showChinese(obj) {
  var eDiv = document.getElementById("page-english");
  var cDiv = document.getElementById("page-chinese");
  cDiv.style.display="block";

  eDiv.style.display="none";
  var eA = document.getElementById("aEnglish");
  eA.className = "";
  obj.className = "";
  obj.className +="selected";
}

