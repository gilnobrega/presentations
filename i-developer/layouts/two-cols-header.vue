<script setup lang="ts">
import { computed } from 'vue'
import SlideHeader from '../components/SlideHeader.vue'

const props = defineProps({
  leftRatio: {
    type: [Number, String],
    default: 1
  },
  rightRatio: {
    type: [Number, String],
    default: 1
  },
  separator: {
    type: Boolean,
    default: true
  }
})

const gridStyle = computed(() => ({
  gridTemplateColumns: `${props.leftRatio}fr ${props.rightRatio}fr`
}))
</script>

<template>
  <div class="slidev-layout two-cols-header bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <!-- Header -->
    <SlideHeader :separator="separator">
      <slot />
    </SlideHeader>
    
    <!-- Content Grid -->
    <div class="grid gap-10 flex-1 min-h-0 text-[#374151]" :style="gridStyle">
      
      <!-- Left Column -->
      <div class="w-full min-h-0">
        <slot name="left" />
      </div>
      
      <!-- Right Column -->
      <div class="w-full min-h-0">
        <slot name="right" />
      </div>
      
    </div>
  </div>
</template>
