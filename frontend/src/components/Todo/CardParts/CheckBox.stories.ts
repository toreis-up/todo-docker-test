import CheckBox from './CheckBox.vue'
import type {Meta, StoryObj} from "@storybook/vue3"

type Story = StoryObj<typeof CheckBox>;

const meta: Meta<typeof CheckBox> = {
  title: 'Todo Card CheckBox',
  component: CheckBox,
  render: (args) => ({
    components: { CheckBox },
    setup() {
      return args
    },
    template: "<CheckBox :done='done' :disabled='disabled' @Change='onChange' />",
  }),
  args: {
    disabled: false,
    done: false
  },
  argTypes: {
    onChange: {action: 'Changed'}
  }
}

export const Default: Story = {

}

export const Done: Story = {
  args: {
    done: true
  }
}

export const Disabled: Story = {
  args: {
    disabled: true
  }
}

export const DisabledDone: Story = {
  args: {
    disabled: true,
    done: true
  }
}

export default meta