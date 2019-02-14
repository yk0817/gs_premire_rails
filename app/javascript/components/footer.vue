<template>
  <div id = "footer">
    <footer class="footer bg-light">
      <div class="container">
        <span class="navbar-brand">{{ msg }}</span>
      </div>
    </footer>
  </div>
</template>
<script>
    export default {
        data () {
            return {
                msg: "gsacademy",
            }
        }
     }
</script>

<style scoped>
.footer {
  height: 40px;
  position: absolute;
  bottom: 0;
  width: 100%;
}
</style>
