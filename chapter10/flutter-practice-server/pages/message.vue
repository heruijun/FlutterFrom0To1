<template>
  <section class="container">
    <el-form
      ref="form"
      label-width="80px">
      <el-form-item>
        <el-input
          v-model="name"
          placeholder="名字"
          clearable/>
      </el-form-item>
      <el-form-item>
        <el-input
          v-model="head"
          placeholder="头像地址"
          clearable/>
      </el-form-item>
      <el-form-item>
        <el-input
          v-model="message"
          placeholder="请输入消息"
          clearable/>
      </el-form-item>
      <el-form-item>
        <el-input
          v-model="time"
          placeholder="请输入时间"
          clearable/>
      </el-form-item>
      <el-form-item>
        <el-button @click="submit">提 交</el-button>
      </el-form-item>
    </el-form>
  </section>
</template>

<script>
import config from '~/common/config.js'
import axios from 'axios'

export default {
  data() {
    return {
      name: '',
      head: '',
      message: '',
      time: ''
    }
  },

  methods: {
    async submit() {
      const { data } = await axios.post(`${config.baseUrl}/messages`, {
        name: this.name,
        head: this.head,
        message: this.message,
        time: this.time
      })
      console.log(data)
    }
  }
}
</script>

<style>
.container {
  min-height: 60vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
</style>
