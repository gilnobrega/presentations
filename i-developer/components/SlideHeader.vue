<script setup lang="ts">
defineProps({
  separator: {
    type: Boolean,
    default: true
  }
})
</script>

<template>
  <div class="mb-6 block w-full slide-header">
    <div class="slide-title">
      <slot />
    </div>
    <div v-if="separator" class="w-full h-1.5 bg-[#3b82f6] mt-4 rounded-full"></div>
  </div>
</template>

<style scoped>
.slide-title :deep(h1) {
  margin: 0 !important;
  font-size: 2.75rem;
  font-weight: 800;
  color: #111827;
  letter-spacing: -0.025em;
  line-height: 1.1;
}
</style>
