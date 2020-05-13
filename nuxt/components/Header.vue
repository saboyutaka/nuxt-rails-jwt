<template>
  <nav id="header" class="bg-gray-800 p-2 mt-0 fixed w-full z-10 pin-t inset-x-0 top-0">
    <div class="flex flex-wrap items-center justify-between">
      <div class="flex justify-center text-white font-extrabold">
        <a class="text-white no-underline hover:text-white hover:no-underline" href="/">
          <span class="text-3xl pl-2">Nuxt-Rails-JWT Todo</span>
        </a>
      </div>
      <div class="flex content-center justify-between">
        <ul class="list-reset flex justify-between flex-1 md:flex-none items-center">
          <li class="mr-3" v-if="$auth.loggedIn">
            <a class="inline-block text-white hover:underline py-2 px-4" @click="logout">ログアウト</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  methods: {
    logout() {
      this.$auth
        .logout()
        .then(() => {
          location.href = '/login'
        })
        .catch(e => {
          this.error = e + '';
        });
    },
  },
};
</script>
