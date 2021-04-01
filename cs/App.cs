using System;
using Erlang;

namespace Eg
{
    public class App : IApp<Tuple<int, int>>
    {
      public Object Start(Tuple<int, int> t) {
        return t.Item1 + t.Item2;
      }
    }
}
