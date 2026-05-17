<script setup lang="ts">
defineProps({
  title: {
    type: String,
    required: true
  }
})
</script>

<template>
  <div class="law-card-component w-full">
    <div class="law-card-title" role="heading" aria-level="3">{{ title }}</div>
    <div class="law-card-body">
      <slot />
    </div>
  </div>
</template>

<style>
.slidev-layout .law-card-title {
  background-color: #ffffff;
  border-radius: 0.5rem 0.5rem 0 0;
  padding: 1rem 1.25rem 0 1.25rem;
  box-shadow: 0 -4px 6px -1px rgba(0, 0, 0, 0.05), 0 -2px 4px -1px rgba(0, 0, 0, 0.03);
  color: #3b82f6;
  font-weight: 700;
  font-size: 1.15rem;
  margin: 0 !important;
  border: none;
  text-align: left;
}

.slidev-layout .law-card-body {
  background-color: #ffffff;
  border-radius: 0 0 0.5rem 0.5rem;
  padding: 0.25rem 1.25rem 1rem 1.25rem;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
  color: #374151;
  font-size: 0.95rem;
  line-height: 1.35;
  margin: 0 0 1rem 0 !important;
  text-align: left;
}

.slidev-layout .law-card-body p {
  margin: 0 !important;
}
</style>
