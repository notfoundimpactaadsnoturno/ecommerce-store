using FluentValidation.Results;
using MediatR;
using System;

namespace EcommerceStore.Core.Messages
{
    // install-package mediatr -version 8.0.1
    public abstract class Command : Message, IRequest<ValidationResult>
    {
        public DateTime Timestamp { get; private set; }
        public ValidationResult ValidationResult  { get; set; }

        public Command()
        {
            Timestamp = DateTime.Now;
        }

        public virtual bool EhValido()
        {
            throw new NotImplementedException();
        }
    }
}
