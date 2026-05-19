<script setup lang="ts">
import { computed } from 'vue'
import SlideHeader from '../components/SlideHeader.vue'

const props = defineProps({
  leftRatio: {
    type: [Number, String],
    default: undefined
  },
  'left-ratio': {
    type: [Number, String],
    default: undefined
  },
  rightRatio: {
    type: [Number, String],
    default: undefined
  },
  'right-ratio': {
    type: [Number, String],
    default: undefined
  },
  separator: {
    type: Boolean,
    default: true
  }
})

const formatCol = (val: string | number | undefined, defaultVal: string = '1fr') => {
  if (val === undefined || val === null || val === '') return defaultVal
  const trimmed = String(val).trim()
  if (typeof val === 'number' || /^[0-9.]+(?:fr)?$/.test(trimmed)) {
    return trimmed.endsWith('fr') ? trimmed : `${trimmed}fr`
  }
  return trimmed
}

const gridStyle = computed(() => {
  const leftVal = props.leftRatio !== undefined ? props.leftRatio : props['left-ratio']
  const rightVal = props.rightRatio !== undefined ? props.rightRatio : props['right-ratio']
  
  return {
    gridTemplateColumns: `${formatCol(leftVal, '1fr')} ${formatCol(rightVal, '1fr')}`
  }
})
</script>

<template>
  <div class="slidev-layout two-cols-header bg-[#f8f9fa] w-full h-full px-12 py-10 flex flex-col">
    <!-- Header -->
    <SlideHeader :separator="separator">
      <slot name="header" />
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
