import consumer from "./consumer"

consumer.subscriptions.create("TestChannel", {
  connected() {
    console.log("Connected to WallChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(date) {
    let test = document.getElementById('test');
    test.innerHTML += "<h1>Updated At:" + date.date + "</h1>"
  }
});
