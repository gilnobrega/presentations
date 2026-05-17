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
      <div class="flex flex-col w-full laws-cards">
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
