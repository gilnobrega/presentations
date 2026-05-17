<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  leftRatio: {
    type: [Number, String],
    default: 1
  },
  rightRatio: {
    type: [Number, String],
    default: 1
  }
})

const gridStyle = computed(() => ({
  gridTemplateColumns: `${props.leftRatio}fr ${props.rightRatio}fr`
}))
</script>

<template>
  <div class="slidev-layout two-cols-header bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <!-- Header -->
    <div class="mb-8 inline-block">
      <div class="slide-title">
        <slot />
      </div>
      <div class="w-full h-1.5 bg-[#3b82f6] mt-4 rounded-full"></div>
    </div>
    
    <!-- Content Grid -->
    <div class="grid gap-10 flex-1 min-h-0 text-[#374151]" :style="gridStyle">
      
      <!-- Left Column -->
      <div class="flex flex-col gap-4 items-start h-full w-full">
        <slot name="left" />
      </div>
      
      <!-- Right Column -->
      <div class="flex flex-col gap-4 items-start h-full w-full">
        <slot name="right" />
      </div>
      
    </div>
  </div>
</template>

<style>
/* Header text styles */
.slidev-layout.two-cols-header .slide-title h1 {
  margin: 0 !important;
  font-size: 2.75rem;
  font-weight: 800;
  color: #111827;
  letter-spacing: -0.025em;
  line-height: 1.1;
}

/* Base typography for this layout */
.slidev-layout.two-cols-header {
  color: #374151;
}

.slidev-layout.two-cols-header h1,
.slidev-layout.two-cols-header h2,
.slidev-layout.two-cols-header h3,
.slidev-layout.two-cols-header h4,
.slidev-layout.two-cols-header h5,
.slidev-layout.two-cols-header h6 {
  color: #111827;
  font-weight: 800;
  letter-spacing: -0.025em;
}

.slidev-layout.two-cols-header strong,
.slidev-layout.two-cols-header b,
.slidev-layout.two-cols-header a {
  color: #3b82f6;
}
</style>
