<template>
  <section class="container">
    <el-form
      ref="form"
      label-width="80px">
      <el-form-item label="用户名">
        <el-input
          v-model="username"
          placeholder="请输入用户名"
          clearable/>
      </el-form-item>
      <el-form-item label="密 码">
        <el-input
          v-model="password"
          placeholder="请输入密码"
          clearable/>
      </el-form-item>
      <el-form-item>
        <el-button @click="login">登 录</el-button>
      </el-form-item>
    </el-form>
  </section>
</template>

<script>
import config from '~/common/config.js'
import axios from 'axios'

export default {
  components: {

  },

  async asyncData({ query }) {
    
  },

  data() {
    return {
      title: '后端管理系统',
      project : 'default',
      username: '',
      password: ''
    }
  },
  head() {
    return {
      title: this.title,
      meta: [
        { name: '后端管理系统' }
      ]
    }
  },

  methods: {
    async login() {
      const { data } = await axios.post(`${config.baseUrl}/user`, {
        username: this.username,
        password: this.password
      })
      console.log(data)
    }
  },

  async asyncData(conext) {
    let result = await new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve('后管系统')
      }, 500)
    })
    return { project : result }
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
