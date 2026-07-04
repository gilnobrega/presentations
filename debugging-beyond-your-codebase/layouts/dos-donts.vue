<script setup lang="ts">
import TwoColsHeader from './two-cols-header.vue'
import RecommendationBox from '../components/RecommendationBox.vue'

const props = defineProps({
  separator: {
    type: Boolean,
    default: true,
  },
})
</script>

<template>
  <TwoColsHeader :separator="separator" left-ratio="1" right-ratio="1">
    <template #header>
      <slot name="header" />
    </template>
    
    <template #left>
      <div class="flex flex-col gap-6 h-full justify-start mt-2">
        
        <RecommendationBox type="dont">
          <slot name="dont" />
        </RecommendationBox>

        <RecommendationBox type="do">
          <slot name="do" />
        </RecommendationBox>
        
      </div>
    </template>

    <template #right>
      <div class="h-full flex items-center justify-center p-4">
        <slot name="right" />
      </div>
    </template>
  </TwoColsHeader>
</template>
