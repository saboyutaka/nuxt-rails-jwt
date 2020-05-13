<template>
  <div>
    <form>
      <input v-model="email" type="email" name="email" />
      <input v-model="password" type="password" name="password" />
      <button type="button" @click="login">
        <span>
          ログイン
        </span>
      </button>
    </form>
    <span v-if="error">{{ error }}</span>
  </div>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    console.log(store.state.auth.loggedIn);
    if (store.state.auth.loggedIn) {
      return redirect('/');
    }
  },
  data() {
    return {
      email: '',
      password: '',
      error: null,
    };
  },
  methods: {
    async login() {
      try {
        await this.$auth.loginWith('local', {
          data: {
            email: this.email,
            password: this.password,
          },
        });
        location.href = '/';
      } catch (e) {
        window.console.log(e);
        this.error = e + '';
      }
    },
  },
};
</script>
