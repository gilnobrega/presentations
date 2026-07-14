<script setup lang="ts">
import TwoColsHeader from './two-cols-header.vue'
import IcebergIssues from '../components/IcebergIssues.vue'

defineProps({
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
</script>

<template>
  <TwoColsHeader
    class="two-cols-iceberg"
    :left-ratio="leftRatio ?? $props['left-ratio']"
    :right-ratio="rightRatio ?? $props['right-ratio']"
    :separator="separator"
  >
    <template #header>
      <slot name="header" />
    </template>
    <template #left>
      <slot name="left" />
    </template>
    <template #right>
      <slot name="right">
        <IcebergIssues :clicks="$clicks" />
      </slot>
    </template>
  </TwoColsHeader>
  
  <!-- Hidden default slot to allow mounting of Slidev click triggers -->
  <div class="hidden">
    <slot />
  </div>
</template>
