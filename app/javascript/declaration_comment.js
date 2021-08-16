function comment_post (){
  const submit = document.getElementById("declaration_comment_submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("declaration_form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const webapp_id = document.getElementById("declaration_id").value
    const user_nickname = document.getElementById("declaration_user_nickname").value
    const url = "/web_app_declarations/" + `${webapp_id}` + "/declaration_comments"
    XHR.open("POST", url, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200){
        alert('Error ${XHR.status}: ${XHR.statusText}');
        return null;
      }
      const comment_list = document.getElementById("declaration_comment_list");
      const comment = XHR.response.comment;
      const formText = document.getElementById("declaration_sentence")
      const html = `${comment.sentence}`
      comment_list.insertAdjacentHTML("afterend", user_nickname + ':' + html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', comment_post);