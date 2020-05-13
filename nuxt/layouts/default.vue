<template>
  <div>
    <Header />
    <main class="container mx-auto bg-white mt-24 md:mt-16 pt-4">
      <nuxt />
    </main>
  </div>
</template>

<script>
import Header from '~/components/Header.vue';

export default {
  components: {
    Header,
  },
  head: {
    bodyAttrs: {
      class: 'font-sans leading-normal tracking-normal',
    },
  },
};
</script>
