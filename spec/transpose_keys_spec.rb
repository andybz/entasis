require 'spec_helper'

describe Entasis::TransposeKeys do
  let(:attributes) do
    { 'Speed' => 200, 'leftFrontDoor' => 'blue', 'RightFront_Door' => 'green' }
  end
  let(:car) { Car.new(attributes) }

  describe '#attributes=' do
    context 'when given a hash' do
      it 'sets the attributes from the given hash' do
        car.attributes = attributes

        expect(car.speed).to eq(200)
        expect(car.left_front_door).to eq('blue')
        expect(car.right_front_door).to eq('green')
      end
    end

    it 'raises an error if attribute is unknown' do
      expect {
        Car.new(unDefined: 'value')
      }.to raise_error Car::UnknownAttributeError, 'unknown attribute: un_defined (transposed from unDefined)'
    end
  end
end
