<template>
  <div id="app">
    <side-bar/>
    <router-view />
  </div>
</template>

<script>
import SideBar from '@/components/SideBar'

export default {
  components:{
    SideBar
  },
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
</style>
