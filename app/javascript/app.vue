<template lang="haml">
.lalala
  .row
    .message.col-xs-3
      %span {{ message }}
      .message.message_bottom
        %span {{ message2 }}
    .message.col-xs-3
      %span {{ message }}
      .message.message_bottom
        %span {{ message2 }}
    .message.col-xs-3
      %span {{ message }}
      .message.message_bottom
        %span {{ message2 }}
    .message.col-xs-3
      %span {{ message }}
      .message.message_bottom{ss: "dddd"}
        %span {{ message2 }}
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      message2: "вот именно :)"
    }
  }
}
</script>

<style lang="scss">
.message {
  font-size: 25px;
  text-align: center;
  color: grey;
  &_bottom {
    font-size: 10px;
  }
}
</style>
