<template>
  <div id="logs-container">
    <ul>
      <li
        v-for="data in logs"
        :key="data.id"
        class="line">
        <p>错误id: {{ data.id }}</p>
        <p>错误机型：{{ data.device }}</p>
        <p>异常名称：{{ data.message }}</p>
        <p>出错位置：{{ data.cause }}</p>
        <ul class="trace-body">
          <li
            v-for="t in data.trace"
            :key="t._id"
            class="trace-line">
            <p>{{ t.library }}</p>
            <p>{{ t.method }}</p>
            <p>{{ t.line }}</p>
            <p>{{ t.class }}</p>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script>
import config from '~/common/config.js'
import axios from 'axios'

export default {
  async asyncData({ query }) {
    const { data } = await axios.get(`${config.baseUrl}/log/find`)
    console.log(data)
    return {
      logs: data.data.logs
    }
  }
}
</script>

<style>
  #logs-container { padding: 10px; font-size: 12px; }
  ul { margin: 0; padding: 0; }
  li { list-style-type: none; }
  .line { margin-bottom: 20px; }
  .trace-body { background-color: #eeeeee; margin: 10px 0; height: 100px; overflow: auto; }
  .trace-line { padding: 3px 10px; }
</style>