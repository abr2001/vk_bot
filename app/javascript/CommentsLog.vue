<template lang="haml">
#logs
  .row.row_striped.row_log.row_header
    .col-md-2 Дата
    .col-md-1 owner_id
    .col-md-3 post_id
    .col-md-3 account_id
    .col-md-3 comment_id
  %span{"v-for": "page in logs"}
    .row.row_striped.row_log{"v-for": "item in page"}
      .col-md-2
        %span {{ item.date }}
      .col-md-1
        %span {{ item.log.owner_id }}
      .col-md-3
        %a{":href": "'https://vk.com/id' + item.log.owner_id + '?w=wall' + item.log.owner_id + '_' + item.log.post_id", target: "_blank"} ссылка
        %span {{ item.log.post_id }}
      .col-md-3
        %span {{ item.account }}
      .col-md-3
        %span {{ item.log.comment_id }}
  .row
    .col-xs-12.text-center.log-more
      %button.btn.btn-default{"@click": "get_logs", "v-if": "(count - getedRows) > 0"}
        Ещё {{ count - getedRows }} из {{ count }}
</template>

<script>
export default {
  data: function () {
    return {
      logs: [],
      page: 1,
      count: 0,
      perPage: 10,
      getedRows: 0
    }
  },
  mounted: function() {
    this.get_logs()
  },
  methods: {
    get_logs () {
      this.$http.get('/api/v1/comments_log', { params: { per_page: this.perPage, page: this.page++ }})
      .then(response => {
        this.logs.push(response.body.logs)
        this.count = response.body.count
        this.getedRows += response.body.logs.length
      }, response => {
      });
    }
  }
}
</script>

<style lang="scss">
  .log-more {
    padding-top: 20px;
  }
</style>
