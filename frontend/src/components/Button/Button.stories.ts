import Button from './Button.vue'
import type {Meta, StoryObj} from "@storybook/vue3"

type Story = StoryObj<typeof Button>;

const meta: Meta<typeof Button> = {
  title: 'Todo Button',
  component: Button,
  render: (args) => ({
    components: { Button },
    setup() {
      return args
    },
    template: "<Button :label='label' :disabled='disabled' @click='onClick' />",
  }),
  args: {
    label: "Test",
    disabled: false,
  },
  argTypes: {
    onClick: {action: 'Clicked'}
  }
}

export const Default: Story = {

}

export default meta