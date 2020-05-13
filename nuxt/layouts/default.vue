<template>
  <div>
    <Header />
    <nuxt />
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
