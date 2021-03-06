require_relative '../../../automated_init'

context "Handle Commands" do
  context "Transactions" do
    context "Withdraw" do
      context "Ignored" do
        handler = Handlers::Commands::Transactions.new

        withdraw = Controls::Commands::Withdraw.example

        account = Controls::Account::Position.example

        assert(account.current?(withdraw.metadata.global_position))

        handler.store.add(account.id, account)

        handler.(withdraw)

        writer = handler.write

        test "Nothing is Written" do
          refute(writer.written?)
        end
      end
    end
  end
end
