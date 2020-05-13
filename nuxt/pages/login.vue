<template>
  <div class="w-full max-w-xs mx-auto pt-10">
    <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
          email
        </label>
        <input
          class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          id="email"
          type="email"
          placeholder="email"
          v-model="email"
        />
      </div>
      <div class="mb-6">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
          Password
        </label>
        <input
          class="shadow appearance-none rounded border w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
          :class="{ 'border-red-500': error }"
          id="password"
          type="password"
          placeholder="******************"
          v-model="password"
        />
        <p class="text-red-500 text-xs italic" v-if="error">{{ error }}</p>
      </div>
      <div class="flex items-center justify-between">
        <button
          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          type="button"
          @click="login"
        >
          ログイン
        </button>
        <a class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" href="#">
          新規登録はこちら
        </a>
      </div>
    </form>
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
        console.error(e);
        if (e.response.status === 401) {
          this.error = 'メールアドレスとパスワードが一致しません';
        }
      }
    },
  },
};
</script>
