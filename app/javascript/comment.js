function comment_post (){
  const submit = document.getElementById("comment_submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const webapp_id = document.getElementById("webapp_id").value
    const user_nickname = document.getElementById("user_nickname").value
    const url = "/web_apps/" + `${webapp_id}` + "/comments"
    XHR.open("POST", url, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200){
        alert('Error ${XHR.status}: ${XHR.statusText}');
        return null;
      }
      const comment_list = document.getElementById("comment_list");
      const comment = XHR.response.comment;
      const formText = document.getElementById("sentence")
      const html = `${comment.sentence}`
      comment_list.insertAdjacentHTML("afterend", user_nickname + ':' + html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', comment_post);