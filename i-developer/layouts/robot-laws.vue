<script setup lang="ts">
import TwoColsHeader from './two-cols-header.vue'
</script>

<template>
  <!-- Inherit the layout structure, typography, and styling from two-cols-header, but pass a custom column ratio -->
  <TwoColsHeader left-ratio="2" right-ratio="1">
    <!-- Map the header slot -->
    <template #default>
      <slot name="header" />
    </template>
    
    <!-- Map the left column for the law cards -->
    <template #left>
      <div class="flex flex-col gap-4 w-full laws-cards">
        <slot />
      </div>
    </template>
    
    <!-- Map the right column for the image -->
    <template #right>
      <div class="h-full w-full flex items-center justify-center image-container">
        <slot name="right" />
      </div>
    </template>
  </TwoColsHeader>
</template>

<style>
/* 
  Styles for the law cards. 
*/
.laws-cards .law-card {
  background-color: #ffffff;
  border-radius: 0.5rem;
  padding: 1rem 1.25rem;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
}

.laws-cards .law-card h3 {
  color: #3b82f6;
  font-weight: 700;
  font-size: 1.15rem;
  margin: 0 0 0.25rem 0;
  border: none;
}

.laws-cards .law-card p {
  color: #374151;
  font-size: 0.95rem;
  line-height: 1.35;
  margin: 0;
}

/* Styles for the right side image */
.image-container img {
  border-radius: 0.5rem;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  max-height: 100%;
  object-fit: contain;
}
</style>
