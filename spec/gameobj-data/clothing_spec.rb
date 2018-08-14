require 'lich/gameobj'
require 'spec/factories'

describe GameObj do
  describe "clothing" do
    describe "randomized treasure system drop nouns" do
      [
        %{armband},
        %{backpack},
        %{bag},
        %{bandana},
        %{belt},
        %{blouse},
        %{bodice},
        %{bonnet},
        %{boots},
        %{bow},
        %{breeches},
        %{cap},
        %{cape},
        %{chemise},
        %{cloak},
        %{coat},
        %{dress},
        %{frock},
        %{gloves},
        %{gown},
        %{greatcloak},
        %{harness},
        %{hat},
        %{hood},
        %{jacket},
        %{kerchief},
        %{kilt},
        %{kirtle},
        %{knapsack},
        %{leggings},
        %{longcloak},
        %{longcoat},
        %{mantle},
        %{overcoat},
        %{pack},
        %{pants},
        %{pouch},
        %{purse},
        %{quiver},
        %{ribbon},
        %{robe},
        %{robes},
        %{sack},
        %{sandals},
        %{sash},
        %{satchel},
        %{scabbard},
        %{scarf},
        %{shawl},
        %{sheath},
        %{shirt},
        %{shoes},
        %{skirt},
        %{slippers},
        %{snood},
        %{socks},
        %{surcoat},
        %{tabard},
        %{trousers},
        %{tunic},
        %{vest},
      ].each do |clothing_name|
        it "recognizes #{clothing_name} as clothing" do
          clothing = GameObjFactory.item_from_name(clothing_name)
          expect(clothing.type).to include "clothing"
          expect(clothing.sellable.to_s).to include "pawnshop"
        end
      end
    end

    describe "clothing not usually found in randomized treasure" do
      [
        %{bloodstained leather survival kit},
      ].each do |clothing_name|
        it "recognizes #{clothing_name} as clothing" do
          clothing = GameObjFactory.item_from_name(clothing_name)
          expect(clothing.type).to include "clothing"
        end

        it "recognizes #{clothing_name} is NOT sellable at the pawnshop" do
          clothing = GameObjFactory.item_from_name(clothing_name)
          expect(clothing.sellable.to_s).to_not include "pawnshop"
        end
      end
    end

    describe "clothing exclusions" do
      [
        %{composite bow},
        %{short bow},
        %{long bow},

        %{elemental bow},
        %{elemental bow of acid},
        %{elemental bow of lightning},
        %{elemental bow of fire},
        %{elemental bow of ice},
        %{elemental bow of vibration},

        %{bone vest},
        %{dirty brown robes},
        %{leather sandals},
        %{leather skull cap},
        %{some leather boots},
        %{some leather sandals},
        %{some flowing robes},

        %{Adventurer's Guild voucher pack},
        %{Elanthian Guilds voucher pack},
      ].each do |item_name|
        it "recognizes #{item_name} is NOT clothing" do
          item = GameObjFactory.item_from_name(item_name)
          expect(item.type.to_s).to_not include "clothing"
        end
      end
    end
  end
end

