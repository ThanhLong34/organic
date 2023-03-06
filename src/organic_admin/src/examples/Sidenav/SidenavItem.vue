<template>
   <router-link :to="{ name: routeName }" class="nav-link" v-bind="$attrs">
      <div
         class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center"
      >
         <slot name="icon"></slot>
      </div>
      <span
         class="nav-link-text"
         :class="this.$store.state.isRTL ? ' me-1' : 'ms-1'"
         >{{ navText }}</span
      >
   </router-link>
</template>
<script>
export default {
   name: "sidenav-item",
   props: {
      routeName: {
         type: String,
         required: true,
      },
      navText: {
         type: String,
         required: true,
      },
   },
};
</script>
