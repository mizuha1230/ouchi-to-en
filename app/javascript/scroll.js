document.addEventListener("turbolinks:load", () => {
  function scrollToEnd() {
      const messageDetails = document.getElementById('message-container');
      messageDetails.scrollTop = messageDetails.scrollHeight;
  }
  scrollToEnd()
})