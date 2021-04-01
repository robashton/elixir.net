using System;
using Erlang;

namespace Eg
{
    public record GenArgs {
        public int Foo { get; init; }
        public int Bar { get; init; }
    }

    public class MyGen : IHandleCall<Atom> { 
      GenArgs args;
      
      public MyGen(GenArgs args) {
        this.args = args;
      }

      public HandleCallResult HandleCall(HandleCallContext ctx, Atom picker) {
        switch(picker) {
          case "foo": 
            return ctx.Reply(this.args.Foo);
          case "bar": 
            return ctx.Reply(this.args.Bar);
          default:
            return ctx.Reply(new Atom("nope"));
        }
      }
    }


    public class Gen : IApp<GenArgs>
    {
      public Object Start(GenArgs args) {
        return GenServer.StartLink(() => new MyGen(args));
      }
    }
}

